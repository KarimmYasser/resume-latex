#!/usr/bin/env bash

export PATH="/Library/TeX/texbin:$PATH"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="${SCRIPT_DIR}/CVs"

mkdir -p "$OUT_DIR"

format_role() {
    local role="$1"
    local IFS='-'
    local words=($role)
    local formatted_words=()
    for w in "${words[@]}"; do
        case "$w" in
            ai) formatted_words+=("AI") ;;
            ml) formatted_words+=("ML") ;;
            cpp) formatted_words+=("CPP") ;;
            *)
                local first="$(echo "${w:0:1}" | tr '[:lower:]' '[:upper:]')"
                local rest="${w:1}"
                formatted_words+=("${first}${rest}")
                ;;
        esac
    done
    local IFS='_'
    echo "${formatted_words[*]}"
}

roles=()
pids=()

for file in "${SCRIPT_DIR}"/cv_content/resume-content-*.tex; do
    [ -e "$file" ] || continue
    filename="$(basename "$file")"
    role="${filename#resume-content-}"
    role="${role%.tex}"
    
    temp_tex="${SCRIPT_DIR}/temp_${role}.tex"
    
    sed "s|\\\\input{resume-content\.tex}|\\\\input{cv_content/${filename}}|" "${SCRIPT_DIR}/resume.tex" > "${temp_tex}"
    
    echo "Starting compilation for ${role}..."
    
    # Run pdflatex in the background asynchronously
    (cd "${SCRIPT_DIR}" && pdflatex -interaction=nonstopmode "${temp_tex}" > "${temp_tex}.out" 2> "${temp_tex}.err") &
    pid=$!
    
    roles+=("$role")
    pids+=("$pid")
done

echo ""
echo "Waiting for all ${#pids[@]} compilations to finish simultaneously..."

# Wait for all the parallel processes to complete
for pid in "${pids[@]}"; do
    wait "$pid" 2>/dev/null || true
done

echo "All compilations finished! Processing PDFs..."
echo ""

for role in "${roles[@]}"; do
    temp_pdf="${SCRIPT_DIR}/temp_${role}.pdf"
    if [ -f "$temp_pdf" ]; then
        formatted_role="$(format_role "$role")"
        out_pdf="${OUT_DIR}/Karim_Yasser_${formatted_role}.pdf"
        cp -f "$temp_pdf" "$out_pdf"
        echo "Successfully compiled ${formatted_role}"
    else
        echo "Failed to compile ${role}. Check log for errors."
    fi
    
    # Remove temporary compilation files for this role
    rm -f "${SCRIPT_DIR}/temp_${role}".*
done
