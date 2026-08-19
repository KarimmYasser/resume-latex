# Resume Content (Master Context Reservoir)

---

## Personal Information

- **Name:** Karim Yasser
- **Location:** Cairo, Egypt
- **Email:** [karimmyasserr@gmail.com](mailto:karimmyasserr@gmail.com)
- **Phone:** +201144432284
- **GitHub:** [github.com/KarimmYasser](https://github.com/KarimmYasser)
- **LinkedIn:** [linkedin.com/in/karimmyasserr](https://www.linkedin.com/in/karimmyasserr/)
- **Portfolio:** [karim-yasser.vercel.app](https://karim-yasser.vercel.app)

---

## Professional Summary

**Computer Engineer** with 2+ years of experience developing mobile and web applications using Flutter, Android, and modern development frameworks. Proven track record in full-stack development, machine learning integration, and agile development methodologies. Strong problem solving skills with experience in data structures, algorithms, and software architecture. Experience leading technical teams and delivering scalable solutions for real-world business challenges.

---

## Education

- **Degree:** Bachelor of Engineering in **Computer Engineering**
- **University:** Cairo University, Faculty of Engineering
- **Date:** Sep 2022 - Jun 2027
- **GPA:** 3.84

---

## Work Experience

### 1. AI Research Intern --- Nile University (SESC Research Center)
*Jul 2026 - Aug 2026*

- Engineered an autonomous **Multi-Agent AI Pipeline** translating natural language simulation descriptions into validated **OpenFOAM** CFD cases using local LLMs (**Ollama/vLLM**) on air-gapped Linux infrastructure; conducted a **40-paper literature review** benchmarking prior SOTA systems (Foam-Agent, ChatCFD).
- Pioneered full-stack **Agent Harness Engineering** creating a **Dual Entry-Point Architecture**: a deterministic **LangGraph state graph** for batch self-correcting generation, and an interactive 19-tool **Model Context Protocol (MCP) server** with a native **TypeScript Pi extension adapter** (JSON-RPC stdio) for in-editor agentic simulation authoring with zero duplicated domain logic.
- Built a **Structured Intermediate Representation (IR)** and **Deterministic C++ Renderer** ("reason free, constrain late" paradigm) across 18 solver families, eliminating cross-file naming drift and syntax hallucinations typical of raw LLM generation.
- Formulated empirical **OpenFOAM v13 Guardrails** derived from a 727+ tutorial corpus analysis, preventing legacy v9/ESI naming drift (`solver <module>`, `physicalProperties`, `momentumTransport`) through structural prompt guidelines and on-demand differential references (`v13-vs-older.md`).
- Designed a stateful **LangGraph self-healing & self-correction workflow** with failure routing across a formal taxonomy (`DICTIONARY_SYNTAX`, `MESH_QUALITY`, `SOLVER_RUNTIME`), targeted AST file-patching, and verifiable evidence-backed **Safe Exit** protocols with anti-laziness guardrails.
- Architected a **3-Level Preflight Gate** (Level A static dictionary audit, Level B checkMesh metric evaluation, Level C residual log-slope convergence predictor / bounded dry-run) that catches syntax, boundary, and numerical errors in seconds before launching full solver runs---eliminating up to **~2 days of wasted compute time**, manual debugging, and failed simulation queue delays.
- Engineered a containerized **Docker validation ladder** with parallel Scotch decomposition (**MPI**), early NaN aborts, and linear solver iteration bounding (**15x speedup** on 5M+ cell meshes); empirically verified on complex high-vortex benchmarks (**RHVT on 10 MPI ranks**) achieving monotonic residual convergence across velocity, enthalpy, and turbulence ($U_x$ -0.10/step, $h$ -0.15, $k$ -0.17).
- Developed an automated **Run Snapshot Engine** (`snapshot.py`) archiving simulation configurations and execution logs on passing validation runs, compressing 374 MB cases into compact **64 KB reproducible verification artifacts** that survive workspace cleanups.
- Built a semantic case-family taxonomy with chunkless RAG across 252 tutorials, a physical-envelope constraint layer clamping LLM parameters to verified thermodynamic bounds, and an $O(1)$-memory boundary parser handling massive meshes (**10.6M+ cells**).
- Hardened system reliability across **288+ automated tests** (267 pytest, 8 TS adapter, 13 shell) with 79%+ code coverage and zero-configuration operational scripts (`setup.sh`, `start.sh`, `check.sh`).

---

### 2. Software Engineer Intern --- Siemens Digital Industries Software
*Jul 2026 - Aug 2026*

- Re-architected the database-generation and ingestion pipeline for the **Commit-Based Analysis Tool (CAT)**, a Test Impact Analysis (**TIA**) and Regression Test Selection (**RTS**) platform used to select affected test suites across **3,275 `.coverage` test suites** and **20,254,418 coverage rows** (**21 GB corpus**) for the **Solido Design Environment** (analog/mixed-signal EDA).
- Slashed end-to-end database creation time from **23.6 hours to 26 minutes** (**~54.5x speedup** / 98.2% runtime reduction) by eliminating intermediate JSON serialization/re-reading and replacing an **11-hour CI `coverage json` conversion phase** (04:55 $\to$ 16:07, larger than the 4h test-execution phase itself) with a high-throughput **native SQLite coverage reader** (`NativeCoverageWorkerPool`), achieving **10.4x whole-path speedup** (26,394s to 2,529s / ~42m) with **20,254,418-row parity** (99.9996% match).
- Solved catastrophic **45.7 GB OOM crashes** during full-scale 21 GB corpus ingestion: root-caused an unbounded output queue where 16 CPU-bound workers outran the single SQLite writer thread with zero backpressure; fixed via **bounded output queue** (`maxsize = num_workers * 4`), capping in-flight file results to pool size and flattening peak RSS to **27 GB--33.8 GB**.
- Deep-profiled per-worker memory (1,589 MB / ~1.55 GB) dominated by PythonParser retained dead scratch across 2,617 unique source files (`_ast_root` 918 MB, dead arcs 223 MB, dead source/statements 117 MB vs only 28 MB `_multiline` needed); implemented incremental per-source **parser scratch nulling** (`_free_parser_scratch`) immediately after region-template generation, reducing per-worker peak RSS from **1,613 MB to 378 MB (4.3x memory reduction)** and total 16-worker footprint from **~25 GB to ~6 GB**.
- Diagnosed and resolved **cross-version interpreter fidelity drift**: CAT ran Python 3.11.13 while tests were collected under Solido Python 3.9.7, causing in-process native parsing to silently drift by **210 `lines_executed` and 5,943 `percent_covered`** rows across 200 files; engineered `NativeCoverageWorker`, a long-lived 3.9.7 subprocess (newline-JSON protocol, `importlib`-by-path imports), achieving **byte-identical fidelity (0 diffs)** against legacy production databases.
- Measured **Amdahl's Law bottleneck decomposition**: per-file native time was 99.1% AST parse/region computation (26.65s), 0.5% source I/O (0.12s), 0.4% SQLite read (0.10s)---proving bulk-read speedup (56x--160x) was invisible at pipeline scale; scaled the faithful worker pool from serial baseline (1,615s) through 4 workers (119.7s, 2.1x) to 8 workers (98.7s, **~16x vs baseline**) with byte-identical outputs.
- Designed a lock-free, filesystem **persistent content-addressed AST parse cache** (keyed by source SHA-256 and namespaced by Python version, coverage version, exclusion config, and format version), eliminating redundant AST statement/branch re-parsing across workers (7.2x redundancy across ~159 recurring shared files) and CI runs to achieve near-zero repeat parse latency.
- Architected an **incremental coverage ingestion** engine with Copy-on-Write (COW) database snapshots, RTS-safe per-test atomic row replacement (`ON CONFLICT(function_id, test_case_id) DO UPDATE`), **SHA-256 manifest gating** (skipping unchanged test suites in **0.05s / ~2,300x faster**), atomic POSIX symlink swaps (`latest.db`), and commit-tracked publish gates (`db_meta.head_commit` + base/head validation) to prevent silent merge stalls on out-of-order CI merges.
- Formulated mathematical cost models for **Size-Adaptive Dispatch**: Online per-test replace ($t = 41 + 3550f$) vs Batch index-dropped reload ($t = 186 + 1888f$); derived empirical crossover at $f^* = 0.087 \implies \mathbf{10%}$, dynamically routing small merges (25--30x faster, ~4s) to online replace and large merges (approaching 100%) to batch replace to prevent a **2.6x quadratic slowdown** (3,640s vs 26 min).
- Validated incremental ingestion on a **49-commit real CI merge walk** (Build 585, Commit `87d0894`): median per-merge ingest time was **7.5s** (vs 23.6h nightly rebuild = **~11,000x faster**), with median test subset $|S_i| = 2$ and 2,933 unique source files parsed per merge at ~0.72 ms/file with warm cache.
- Optimized database architecture and query throughput: eliminated $N+1$ single-function lookup bottlenecks via chunked batched queries (20k connections dropped **20,000 $\to$ 27**, 1.94x faster), engineered **covering indexes** (`idx_coverage_composite`) eliminating **~3.8M base-table lookups** (4.82x read speedup), enabled **range/threshold indexes** (`idx_coverage_percent_function`, 2.74x--5.56x, killing TEMP B-TREEs) and `idx_coverage_test_case` (eliminating 118 full-table scans of 20M rows on incremental DELETEs), and built an append-only transactional schema migration engine (`PRAGMA user_version`, v0 $\to$ v8).
- Root-caused and fixed **NFS writer connection churn**: legacy writer opened/closed connections per file (~5,700 cycles for 2,877 files), forcing a `wal_checkpoint` fsync round-trip over NFS and discarding 100 MB page cache per close; replaced with a single long-lived writer connection and engineered **bulk unsafe writes** (`CAT_BULK_UNSAFE_WRITES=1`: `journal_mode=OFF`, `synchronous=OFF` on disposable scratch copies before atomic symlink swap), cutting write time from 216.5s to 88.1s (**-59% / 128.4s saved**) and total ingest by **-24.8%**.
- Investigated empirical **coverage execution non-determinism**: measured only **6.90% hit-rate** (217/3,147 tests) across same-commit builds (585 vs 586), with 93.1% misses root-caused to runtime infrastructure modules (`NodeManager` in 1,511 tests, `pexpect` in 1,209, `NodeHeartbeatThread` in 1,103); parallelized SQLite arc hash-decoding across 16 workers, reducing decode time from 573 ms/file to **49 ms/file (11.7x speedup)** and full census time from 57 minutes to 244 seconds.
- Autopsied high-fan-in utility functions (2,424 functions selected $\ge 90%$ of suite, generating 7.07M rows / 36.7% of DB; e.g. `getLogger` selecting 3,146 tests); researched **Branch-Arc Signatures** clustering intra-function branch execution equivalence classes, proving a **690x reduction** in impacted test selections (from 6,887,309 impacted pairs to 9,981 distinct arc groups across 2,490 explosive functions; `getLogger` collapsed to 5 arc groups; test selection dropped from 2,766 to 12 tests) with **99.9%--100% signature determinism**.
- Led the **CAT 3 cutover**: transitioned to a streamlined **membership set-intersection gating** engine (`hit = executed_arcs $\cap$ region.lines`), achieving **2.04x speedup** (130.6s vs 266.4s) and 2.47x lower cost per row (26.1 $\mu$s vs 64.5 $\mu$s) while safely closing an unsafe under-selection edge case; completely deprecated and removed legacy JSON streaming paths (`ijson`, `JsonStreamParser`, `CoverageJsonConverter`, `use_native_coverage`).
- Built a **mutation testing harness** with `cosmic-ray` for fault-detection verification of pruned test sets, resolving 3 grid environment blockers (bind-mounted staged NFS tree for 78 compiled `.so` library `DT_RPATH`s, `lockserver`-routed `vardes_rcfile`, and a latent same-process SQLite double-open deadlock in `TaskDataBuilder`); achieved **20/20 GREEN pristine baseline** for target functions (112 mutants across 4 arc groups).
- Conducted a head-to-head **architectural audit** of the competing SCAT implementation (C++/MariaDB): benchmarked raw SQL vs SQLAlchemy ORM (proving ORM adds 25x--365x write overhead and 5x read overhead), and exposed SCAT's N+1 queries, lack of secondary indexes, plaintext passwords in source/CI, and shell injection vulnerabilities (`subprocess.getoutput(f"...")`) to document the technical advantages of the re-architected SpyCAT engine.

---

### 3. Backend Development Intern (DCX) --- Ejada Systems
*Jul 2026*

- Architected a production-grade **Distributed E-Commerce Microservices Platform** comprising 6 deployable services using **Spring Boot 3**, **Spring Cloud (2025)**, and a strict **database-per-service** architecture (`inventory_db`, `wallet_db`, `shop_db`) to ensure full domain isolation.
- Implemented a synchronous **Distributed Checkout Saga** with automated **compensating transactions** across `shop-service`, `inventory-service` (stock reservation), and `wallet-service` (idempotent ledger debit), guaranteeing data consistency across partial failures.
- Built a perimeter-level **Stateless JWT Security Architecture** with `wallet-service` as Identity Provider (IdP) and `api-gateway` performing edge token validation and `X-User-Id`/`X-User-Roles` header injection, shielding internal RPC endpoints from public exposure.
- Engineered fault-tolerant inter-service communication using **OpenFeign** and **Resilience4j** (`@CircuitBreaker`, `@Retry`, `@TimeLimiter`), segregating business domain errors (409 Out of Stock, 402 Insufficient Funds) from network faults to prevent cascade circuit trips.
- Configured centralized cloud infrastructure with **Spring Cloud Config Server** (zero-committed secrets), **Netflix Eureka** service discovery, and a full-spectrum testing suite using **Testcontainers** (real MySQL) and **WireMock**.

---

### 4. Agentic AI Trainee --- Orange Digital Center Egypt
*Feb 2026 - Apr 2026*

- Built AI agents with LLMs using the LangChain framework in Python, managing memory and context, integrating knowledge bases, coordinating multiple agents, and automating tasks via APIs; the prototypes demonstrated end-to-end agent workflows.
- Built and evaluated agent-driven applications with LangChain and React, then deployed them via a responsive web interface, allowing stakeholders to test AI agent functionality in real time.
- Evaluated local versus remote LLMs for application integration, optimizing operational costs by strategically limiting API requests based on business and technical requirements.

---

### 5. Session Lead --- Udacity (Digital Egypt Cubs Initiative - DECI)
*Nov 2025 - Mar 2026*

- Led weekly sessions for student cohorts, using interactive coding labs and visualizations of finite state machines and quantum algorithms to reinforce core computer fundamentals and align with Udacity's learning standards, resulting in higher student engagement and improved concept mastery.
- Supported learners by delivering guided explanations, practical examples, and structured discussions using C and C++ coding labs, which helped students achieve high-quality learning outcomes and improve assignment completion rates.
- Monitored student progress and maintained a remote learning environment by collaborating with Udacity's instructional team, using GitHub to track assignments and Java-based dashboards, which enabled early identification of struggling learners and smoother course delivery.

---

### 6. Resource Management Team Member --- Enactus Cairo University
*Dec 2025 - Feb 2026*

- Supported the Resource Management Team in planning and preparing the annual Enactus cycle by coordinating tasks with Agile/Scrum practices, which streamlined the schedule and enabled on-time delivery of all milestones.
- Applied structured ideation and validation methods across teams in the Innovation Campus program, resulting in several validated concepts ready for prototype development.
- Engaged in problem validation processes including survey design, market research, and expert consultations (e.g., doctors) to ensure solution relevance before project kickoff.

---

### 7. Software Developer --- I'SUPPLY
*Jul 2025 - Dec 2025*

- Won first place in a 30+ team hackathon, earning a full-time position offer.
- Collaborated with back-end engineers and QA testers in an agile setting to analyze the Flutter desktop app's architecture and state management, enabling faster feature prioritization and reducing development rework.
- Implemented offline functionality, fixed existing bugs, and added small features for the first release, ensuring stability and usability.
- Developed and optimized complex MySQL queries for the offline server, reducing data-retrieval time and improving overall database performance.

---

### 8. Data Science Trainee --- Digital Egypt Pioneers Initiative (DEPI)
*Jun 2025 - Dec 2025*

- Completed IBM Data Scientist certification with Python, SQL, and machine learning.
- Implemented MLOps workflows with MLflow and HuggingFace, automating model versioning and deployment to a cloud environment, which reduced deployment time and ensured reproducible pipelines.
- Led a capstone project that created a full ML pipeline using Python, PyTorch Lightning, and custom feature-engineering scripts to predict customer churn, delivering a prototype that enabled the team to identify high-risk customers and prioritize retention actions.

---

### 9. Android Developer Intern --- Banque Misr
*Jul 2025 - Sep 2025*

- Developed native Android applications using Kotlin, Android Jetpack components, and Room Database for local data persistence, implementing MVVM architecture to create scalable, maintainable mobile solutions that improved user experience and optimized performance, resulting in smoother navigation and higher user satisfaction.

---

### 10. Mobile Development Intern (Flutter & ML) --- Informatique
*Jul 2025 - Aug 2025*

- Integrated PyTorch Lightning-trained machine learning models into Flutter applications using TensorFlow Lite, enabling the app to respond to user inputs in real time.
- Developed cross-platform features by bridging Dart with ML frameworks (e.g., TFLite/ML Kit) for on-device data processing.

---

### 11. Flutter Instructor --- IEEE Cairo University SB
*Feb 2025 - May 2025*

- Instructed 30+ students in Flutter development, state management, and API integration with 90% satisfaction.
- Conducted code reviews and mentoring that improved project quality by 35%.

---

### 12. Mobile App Development Trainee --- Orange Digital Center
*Jan 2025 - Mar 2025*

- Completed a 96-hour Flutter training program using Dart and Provider for state management, applied clean-architecture principles, and delivered a functional cross-platform mobile app prototype.

---

### 13. Flutter Developer Intern --- SlashHub
*Oct 2024 - Jan 2025*

- Designed reactive UI components for an AI-powered e-commerce chatbot using **Flutter**, implementing real-time messaging, product recommendations, and natural language processing integration, which improved user engagement metrics by 25% and reduced bounce rates.

---

## Projects

### 1. Commit-Based Analysis Tool (CAT) - 54.5x Test Impact Analysis Optimization
*Jul 2026 - Aug 2026*

Engineered an end-to-end performance and architectural overhaul of the **Commit-Based Analysis Tool (CAT)**, a Regression Test Selection (**RTS**) platform for Siemens EDA's **Solido Design Environment** (3,275 test suites, 20.25M coverage rows, 21 GB corpus). Slashed end-to-end database creation time from **23.6 hours to 26 minutes** (**~54.5x speedup** / 98.2% runtime reduction) by eliminating intermediate JSON serialization and replacing an **11-hour CI `coverage json` conversion phase** with a high-throughput **native SQLite coverage reader** (`NativeCoverageWorkerPool`, 10.4x whole-path speedup). Solved catastrophic **45.7 GB OOM crashes** via bounded queue backpressure and incremental parser scratch nulling (4.3x per-worker RAM reduction: 1,613 MB to 378 MB; pool footprint ~25 GB to ~6 GB). Engineered a cross-version Python 3.9/3.11 fidelity worker (0 diffs), a lock-free **persistent content-addressed AST parse cache** (SHA-256 keyed), and an **incremental Copy-on-Write ingestion** pipeline with SHA-256 manifest gating (**0.05s** unchanged runs, median **7.5s** per merge across 49 CI commits). Formulated **Size-Adaptive Dispatch** ($f^*=10%$), optimized SQLite with **covering indexes** and batched queries (**4.82x faster reads**, eliminating 3.8M lookups), enabled transactional schema migrations (`PRAGMA user_version`, v0 $\to$ v8), and cut NFS write time by **-59%**. Researched **Branch-Arc Signatures** to collapse explosive high-fan-in test selections by **690x** (6.88M to 9,981 arc groups; `getLogger` 3,146 to 5 groups) with 99.9%--100% determinism, validated via a `cosmic-ray` mutation testing harness (20/20 green baseline).

---

### 2. Autonomous Agentic CFD Pipeline (OpenFOAM Multi-Agent System)
*Jul 2026 - Aug 2026* | [GitHub](https://github.com/KarimmYasser/NU-research-intern)

Architected an autonomous **Multi-Agent AI Pipeline** and **Dual Entry-Point Platform** via advanced **Agent Harness Engineering**, translating natural language simulation prompts into verified, runnable **OpenFOAM** CFD cases using local LLMs (**Ollama/vLLM**) on isolated infrastructure. Developed a deterministic **LangGraph state graph** featuring an automated **self-healing loop**, targeted file-patching LLM nodes, and an evidence-backed **Safe Exit protocol** with anti-laziness filters, paired with an interactive 19-tool **Model Context Protocol (MCP) server** and native **TypeScript Pi extension adapter** (JSON-RPC stdio). Built a **Structured IR + Deterministic Renderer** engine across 18 solver families enforcing **OpenFOAM v13 guardrails** (727+ tutorial corpus analysis) to eliminate C++ dictionary syntax errors and legacy v9 drift. Implemented a **3-Level Preflight Gate** (static dictionary audit, checkMesh evaluation, residual log-slope convergence predictor) catching errors before execution to eliminate up to **~2 days of wasted compute time**, an automated **Run Snapshot Engine** (64 KB reproducible verification artifacts from 374 MB runs), and a **Docker validation ladder** supporting parallel Scotch decomposition (**MPI**, verified on multi-rank RHVT benchmarks), linear solver iteration bounding (**15x speedup**, 10.6M+ cells), and early NaN aborts. Validated across **288+ automated tests** (pytest, TS adapter, shell) and packaged as a one-command air-gapped bundle.

---

### 3. Distributed E-Commerce Microservices Platform (Spring Cloud)
*Jul 2026* | [GitHub](https://github.com/KarimmYasser/ecommerce-microservices-platform)

Architected a production-grade distributed microservices backend with **Spring Boot 3** and **Spring Cloud (2025)** across 6 deployables. Implemented a strict **database-per-service** architecture (MySQL), a synchronous **Distributed Checkout Saga** with automated compensation logic, and perimeter **JWT stateless security** via **Spring Cloud Gateway**. Engineered fault-tolerant inter-service RPCs with **OpenFeign** and **Resilience4j** (Circuit Breakers, Retries, Time Limiters), centralized configuration via **Spring Cloud Config Server**, and service discovery with **Netflix Eureka**. Comprehensive test coverage via **Testcontainers** and **WireMock**.

---

### 4. QA Copilot (guardband) - Multi-Agent Test Intelligence Platform
*Jun 2026 - Jul 2026*

Architected a multi-agent QA test intelligence copilot for variation-aware IC design verification software (**Siemens Solido Design Environment**). Designed 4 specialized Claude/Gemini/Groq agents: **SpecAnalyzer** (FURPS+ requirement tagging), **TestGenerator** (happy/boundary/negative/adversarial synthesis), **RiskPrioritizer** (impact $\times$ likelihood P0--P3 risk scoring), and **LogTriage** (root-causing massive Monte Carlo, PVT corner, and High-Sigma HSMC regression logs into `REGRESSION`, `FLAKY`, `ENVIRONMENT`, and `NEEDS_HUMAN` verdicts with cited evidence). Built a full-stack platform with **FastAPI**, an interactive **React/Vite** dashboard, and one-command **Docker Compose** deployment.

---

### 5. WASAF - Waveform-Aware Semantic Analysis Framework for Analog EDA
*Jun 2026 - Jul 2026*

Architected an open-source 4-layer semantic analysis framework for analog circuit simulation waveforms (RAW, PSF) bridging SPICE simulators (**Cadence Spectre, Eldo/AFS, ngspice**) with grounded AI reasoning. Built **L1 IO** parser adapters (`spicelib`, `psf-parser`) into a multidimensional `WaveformDataset` handling corner/Monte Carlo sweeps; engineered **L2 DSP Feature Extractors** (step responses, settling time, damping ratio $\zeta$, phase margin, slew rate, THD) with confidence scores; designed **L3 Kleene 3-valued logic** rule engine with YAML knowledge bases; and created **L4 LLM reasoning** with structured anti-hallucination serialization. Enforced spec-first design with 187+ unit/property tests.

---

### 6. GSoC Pathfinder - AI Agent Organization Matcher
*Jun 2026* | [GitHub](https://github.com/KarimmYasser/GSoCPathfinder)

Built an end-to-end **AI Agent** system that matches candidate profiles to **Google Summer of Code** organizations using a **LangGraph** agentic pipeline. Ingested and canonicalized **11 years** of GSoC data (663 organizations, 12k+ projects) into a **dual-database** store: **Neo4j** for temporal knowledge graph queries and **Qdrant** for semantic vector search. Engineered a **high-performance Rust scoring engine** (PyO3/Maturin) implementing a **7-Factor weighted ranking** (Skill Overlap, Semantic Similarity, Recency, Topic Alignment, Project Volume, Org Stability, LLM Relevance) with CV-frequency-weighted Jaccard similarity. Exposed endpoints via **FastAPI** and built an interactive **React/Vite** dashboard featuring a 2D force-directed **Knowledge Graph Visualizer**, CV gap analysis & learning roadmap optimizer, proposal draft generator, and a draggable chat assistant.

---

### 7. Wavelength - Automated 3-Stage arXiv Research Discovery Pipeline
*May 2026 - Jun 2026*

Engineered an automated research intelligence pipeline discovering and evaluating cutting-edge computer science papers from arXiv. Built **Stage 1 Scraper** with deduplication, priority category filtering (`cs.AI`, `cs.LG`, `cs.SE`, `cs.CR`), and SQLite WAL persistence; developed **Stage 2 First Review** executing batch LLM evaluations across 7 scoring dimensions (novelty, feasibility, recruiter impact, industry relevance, composite); and built **Stage 3 Second Review** implementing strict quality control to eliminate category inflation, detect reproduction vs genuine novelty, and generate structured research roadmaps (`ideas.md`, `trends.md`).

---

### 8. Autonomous Wall-Following Robot (Sim-to-Real Development)
*Apr 2026 - May 2026* | [GitHub](https://github.com/KarimmYasser/robot-wall-follower)

Engineered a high-performance autonomous robot bridging **Webots Digital Twin** simulation and hardware. Developed professional-grade **bare-metal C** firmware for **ATmega328P** utilizing **Timer1** and **EXTI/PCINT** interrupts for non-blocking sensing. Designed a **Cascaded PID Controller** nesting a wall-distance loop within an **IMU-based** heading loop for fluid navigation and exact 90° pivots, utilizing **First-order Lag Filters** for sensor signal smoothing. Implemented a **Finite State Machine (FSM)** for autonomous decision-making and integrated real-time turn sequence telemetry reporting via **Bluetooth (HC-05)**.

---

### 9. Aladdin: Nasira's Revenge - C++ Game Engine
*Mar 2026 - May 2026* | [GitHub](https://github.com/KarimmYasser/aladdin-nasiras-revenge)

Developed a high-performance 3D engine using **C++17** and **OpenGL 3.3** featuring a data-driven **Entity Component System (ECS)** with deferred lifecycle management for memory stability. Engineered a **command-based renderer** with **16k shadow mapping** and GPU-accelerated vertex skinning. Built a **miniaudio**-based system with disk-streamed BGM and integrated **FFmpeg** for real-time video streaming. Optimized world geometry via **Greedy Rectangular Merging** and implemented reactive **Finite State Machine (FSM)** AI for autonomous enemy behavior.

---

### 10. Industrial Machine Sound Classification & Anomaly Detection
*Mar 2026 - May 2026* | [GitHub](https://github.com/KarimmYasser/machine-sound-classification)

Architected a **Dual-Track AI pipeline** for predictive maintenance of **pumps, fans, and motors** (56k recordings). Developed an **XGBoost edge champion** (<10ms latency) and **EfficientAT** (EfficientNet + Transformer) for cloud diagnostics, achieving **95.61% accuracy**. Engineered a high-performance **Rust engine** using **PyO3** and **Rayon**, achieving a **57x speedup** in feature extraction. Resolved severe data imbalance using **Conditional GANs (CGAN)** and eliminated session leakage through **DBSCAN Cluster-Aware splitting**. Deployed via **Docker** and **Hugging Face**.

---

### 11. Cryptographic Research: Multi-Architecture Hash Competition
*Apr 2026* | [GitHub](https://github.com/KarimmYasser/crypto-hash-architecture-analysis)

Evaluated **10 distinct cryptographic hash architectures** (BLAKE, Keccak, Skein, etc.) to analyze the trade-off between **diffusion speed** and **structural integrity**. Developed a **custom "Hidden Security" test suite** to simulate advanced cryptanalysis, identifying and patching vulnerabilities to **Length-Extension Attacks (LEA)** and short-message bias. Engineered a high-performance **BLAKE-256** implementation from scratch using **ARX primitives** and **manual loop unrolling**, achieving a near-perfect **0.9998 security score**. Verified compliance with the **Strict Avalanche Criterion (SAC)** via automated hyperparameter tuning of rotation constants.

---

### 12. AI API Evaluation Framework (GSoC 2026 Research & Implementation)
*Mar 2026 - Apr 2026* | [GitHub](https://github.com/KarimmYasser/ai-eval-framework)

Engineered a research-driven evaluation platform for **Multimodal AI** (Text, Image, Audio) and **Agentic Workflows** following a deep literature review of **MUSE**, **TopoBench**, and **BEHELM** frameworks. Implemented a **Five-Level Quality Taxonomy** and **Dual-Metric Framework** (Hard/Soft Scores) to analyze model fidelity beyond binary pass/fail metrics. Developed an **Agent Trace Viewer** for multi-turn loops, enabling granular **credit assignment** across reasoning and tool-calling steps. Built a high-performance **FastAPI** orchestrator with **SSE streaming** for real-time monitoring and integrated **lm-evaluation-harness** wrappers into a native **Flutter** dashboard.

---

### 13. Research Initiative: Quantum Foundations & Post-Quantum Security
*Mar 2026 - Apr 2026*

Conducted extensive theoretical research into **Quantum Computing foundations** (superposition, entanglement, Shor's and Grover's algorithms) to analyze the systemic threat to classical asymmetric cryptography. Investigated the mathematical structures of **Post-Quantum Cryptography (PQC)**, specifically **Code-Based** and **Lattice-Based** schemes. Evaluated constant-time encoding techniques for constant Hamming weight vectors, analyzing their role in mitigating **Side-Channel (Timing) Attacks** in a quantum-adversarial landscape.

---

### 14. Space Station Supply Agent (ODC AI Training)
*Mar 2026* | [GitHub](https://github.com/KarimmYasser/sql-station-logistics-chatbot)

Built a **LangGraph**-based conversational AI agent translating natural language into **SQLite** queries. Engineered an autonomous error recovery system with a self-healing loop and applied hallucination detection guards over token-optimized schemas.

---

### 15. Adventure Time Lore Keeper (ODC AI Training)
*Mar 2026* | [GitHub](https://github.com/KarimmYasser/neo4j-adventure-time-chatbot)

Developed a conversational agent interacting with a **Neo4j** Knowledge Graph. Implemented dynamic **Cypher** query generation with self-healing error recovery, conversational memory, and automated entity alias resolution for consistent multi-turn interactions.

---

### 16. Rusty Sherlook - High-Performance Search Engine
*Feb 2026 - Mar 2026* | [GitHub](https://github.com/KarimmYasser/rusty-sherlook-engine)

Engineered a high-concurrency extension to the Sherlook search engine in **Rust** utilizing **Tokio**. Integrated **Qdrant** for semantic vector search and **Neo4j** for advanced graph-based PageRank processing.

---

### 17. BioMedIAMBZ - Brain Tumor Segmentation (1st Place)
*Feb 2026* | [GitHub](https://github.com/KarimmYasser/braTs-ai-hackathon-ODCxINSTANT)

Won **1st place** in the ODC x INSTANT AI Hackathon by developing a 3D brain tumor segmentation pipeline using **MedNeXt** (ConvNeXt-based CNN) with **PyTorch** and **MONAI**. Achieved superior performance over Transformer architectures (UNETR, SwinUNETR) on the BraTS 2021 dataset through deep supervision and ensemble techniques. Engineered a **40x faster** preprocessing pipeline and deployed the model via **FastAPI** backend with **React Native** mobile interface for real-time inference.

---

### 18. FM Stereo Broadcasting System Simulation
*Dec 2025* | [GitHub](https://github.com/KarimmYasser/FM_Stereo_System)

Implemented a software-defined **FM Stereo Transmitter and Receiver** in **Python** using **NumPy** and **SciPy**. Conducted experimental analysis on frequency deviation, noise immunity, channel separation, filter design impact, and system robustness under oscillator drift.

---

### 19. VLSI Convolution Systolic Accelerator
*Nov 2025 - Dec 2025* | [GitHub](https://github.com/KarimmYasser/VLSI-Convolution-Systolic-Accelerator)

Designed a high-performance 2D convolution accelerator in **Verilog** using an 8x8 systolic array and SKY130 PDK. Implemented the full RTL-to-GDSII flow via OpenLane, featuring ping-pong buffering and fixed-point arithmetic for optimized neural network inference.

---

### 20. 5-Stage Pipelined Processor
*Oct 2025 - Dec 2025* | [GitHub](https://github.com/KarimmYasser/stall_3alda2ery)

Designed a 32-bit 5-stage pipelined processor in VHDL with Von Neumann architecture, supporting interrupts and I/O. Implemented hazard handling via data forwarding and branch prediction, and built a custom assembler in Python to automate machine code generation.

---

### 21. Yapper - X Clone Mobile App
*Oct 2025 - Dec 2025* | [GitHub](https://github.com/KarimmYasser/yapper-mobile)

Built a cross-platform **React Native** social media app with **Expo**, featuring real-time **WebSocket** messaging, push notifications, multi-language support with full **RTL**, AI-powered tweet summarization, and a comprehensive test suite with **CI/CD** automation via EAS.

---

### 22. Walmart Sales Forecasting - ML Pipeline
*Nov 2025* | [GitHub](https://github.com/KarimmYasser/Walmart-Sales-Forecasting-ML)

Developed an end-to-end **ML pipeline** for weekly sales forecasting across 45 stores, achieving **99.96% R²** accuracy with **Random Forest**. Built 44 engineered features, deployed via **FastAPI** and **Streamlit** with **MLflow** tracking and **Docker** containerization.

---

### 23. i'Supply POS App - First Place Hackathon Winner
*Jun 2025* | [GitHub](https://github.com/KarimmYasser/isupply_app)

Developed a cross-platform **Flutter POS system** for desktop and mobile, featuring inventory search, cart management, checkout, and invoice tracking. Integrated **Hive** for local storage and **Supabase** for the back-end with offline synchronization, supporting more than **1000 products** through paginated lists, leading to a **full-time** opportunity.

---

### 24. Anghami PiP Chrome Extension
*Sep 2025* | [GitHub](https://github.com/KarimmYasser/anghami_pip_extension)

Engineered a TypeScript Chrome extension using the Document PiP API to create an always-on-top, system-level mini-player for the Anghami web app.

---

### 25. Wuzzuf Engineering Jobs Scraper
*Sep 2025* | [GitHub](https://github.com/KarimmYasser/wuzzuf-job-scraper)

Developed a web scraper using Python and Selenium to automatically extract engineering job listings from Wuzzuf.net and export the data to CSV/JSON.

---

### 26. Coffee Shop Android App
*Aug 2025 - Sep 2025* | [GitHub](https://github.com/KarimmYasser/coffee_shop)

Developed an offline-first coffee shop using Kotlin Jetpack Compose, implementing Clean Architecture with MVVM, Hilt for dependency injection, Room, and Retrofit.

---

### 27. Instagram Followers Analyzer
*Aug 2025 - Sep 2025* | [GitHub](https://github.com/KarimmYasser/FollowersInstagram)

Developed a privacy-focused Windows desktop application to locally analyze Instagram data exports and analyze followers.

---

### 28. RecipeBox Recipe Management App
*Aug 2025* | [GitHub](https://github.com/KarimmYasser/recipe-box)

Developed a modern, offline-first Android recipe app using Jetpack Compose, architected with Clean Architecture (MVVM), Room, and Dagger/Hilt.

---

### 29. Personal Portfolio Website
*Jul 2025 - Sep 2025* | [GitHub](https://github.com/KarimmYasser/portfolio)

Engineered a modern, animated portfolio website with React and TypeScript, featuring a dynamic 3D background using Three.js, Framer Motion animations, and a Vercel serverless contact form.

---

### 30. School Timetable Generator
*Jul 2025 - Aug 2025* | [GitHub](https://github.com/KarimmYasser/school_scheduler)

Developed an AI-driven school timetable generator in Python, using Google OR-Tools for constraint satisfaction, and featuring full bilingual (English/Arabic) support.

---

### 31. SecureNotes Android App
*Jul 2025* | [GitHub](https://github.com/KarimmYasser/secure-notes)

Developed a secure Android notes application using Jetpack Compose for the UI and Proto DataStore for type-safe, persistent settings management.

---

### 32. Zengbary App
*Mar 2025 - May 2025* | [GitHub](https://github.com/KarimmYasser/zengbary-app)

Developed a Flutter app to remotely control a microprocessor-based robot with HTTP communication.

---

### 33. Sherlook Web Engine
*Mar 2025 - May 2025* | [GitHub](https://github.com/KarimmYasser/sher-look)

Built a web search engine with a custom crawler, indexer, and ranking algorithm processing 50K+ pages.

---

### 34. OS Process Scheduler Simulator
*Mar 2025 - May 2025* | [GitHub](https://github.com/KarimmYasser/kernel-sim-ohh-s)

Simulated multiple CPU scheduling algorithms (FCFS, SJF, Priority, Round Robin) with real-time visualization and metric comparisons.

---

### 35. Hangouts Crincale - Audio Analysis Tool
*Feb 2025 - Mar 2025* | [GitHub](https://github.com/KarimmYasser/hangouts_crincale)

Engineered a professional-grade, cross-platform audio analysis application in Flutter, providing tools for frequency response visualization, parametric equalization, and direct hardware control.

---

### 36. Custom Unix Shell (cmpsh)
*Feb 2025* | [GitHub](https://github.com/KarimmYasser/cmpsh)

Implemented a lightweight Unix shell in C, demonstrating core OS concepts like process management (fork/exec), piping, and I/O redirection.

---

### 37. Research: Adaptive Intrusion Detection via Behavioral Modeling
*Dec 2024* | [GitHub](https://github.com/KarimmYasser/Intrusion-Detection-Systems)

Engineered a data-driven **Intrusion Detection System (IDS)** to transition from static signature-based security to adaptive behavioral modeling. Analyzed the **RRE-KDD dataset** (148k+ events, 37 attack types) to define network baselines using **Random Forest ensembles** and statistical thresholding (**Z-score**, Moving Average). Validated anomaly detection accuracy through **Chi-square feature selection** and hypothesis testing. Awarded **7th place** at the **TCCD Research Day** for excellence in network security modeling.

---

### 38. Fashion Assistant - E-commerce Platform
*Nov 2024 - Dec 2024* | [GitHub](https://github.com/KarimmYasser/Slash-Fashion-Assistant-App)

Built a personalized shopping assistant with a chatbot and a product recommendation system.

---

### 39. Bricks Breaker - Multiplayer Assembly Game
*Nov 2024 - Dec 2024* | [GitHub](https://github.com/KarimmYasser/brick-breaker-pro)

Built a real-time multiplayer brick breaker game using Assembly with custom networking and graphics logic.

---

### 40. AES Encryption - FPGA Implementation
*Feb 2024 - Apr 2024* | [GitHub](https://github.com/KarimmYasser/AES)

Redesigned AES-128/192/256 in Verilog for FPGA, achieving 40% faster encryption using pipelining and parallelism.

---

### 41. Alien Invasion Simulator
*Feb 2024 - Apr 2024* | [GitHub](https://github.com/KarimmYasser/Alien_Invasion_Project)

Designed and implemented an alien invasion simulator in C++ as part of a team, featuring custom-built data structures and object-oriented design patterns.

---

### 42. Paint for Kids
*Nov 2023 - Jan 2024* | [GitHub](https://github.com/KarimmYasser/paint-for-kids)

Developed an educational drawing and gaming application for children in C++, implementing key design patterns like Command and Factory for its architecture.

---

## Technical Skills

### Programming Languages
Dart, Kotlin, Python, C, C++, Rust, Java, TypeScript, JavaScript, SQL, Assembly

### Mobile Development
Flutter (Mobile & Desktop), Android Development (Kotlin, Jetpack Compose, XML Views), React Native (Expo)

### Frameworks & Libraries
Spring Boot 3, Spring Cloud (Gateway, Eureka, Config, OpenFeign), Spring Security 6, Resilience4j, Testcontainers, WireMock, LangGraph, LangChain, Pydantic, Flutter Bloc, Riverpod, Provider, GetX, Dagger/Hilt, Android Navigation Component, Room, Retrofit, Firebase, RESTful APIs, Zustand, React Query, Socket.io, Axios, i18next, Zod, PyTorch, MONAI, PyTorch Lightning, Scikit-learn, Pandas, NumPy, Streamlit, Selenium, FastAPI, OpenGL, ReactPhysics3D, Assimp, FFmpeg, miniaudio, ATmega328P (AVR), Tkinter

### Backend & Database
Supabase, Firebase, MySQL, SQLite Performance Tuning (WAL Mode), Covering Indexes & Query Optimization, Schema Versioning & Migrations (PRAGMA user_version), High-Throughput Bulk Ingest, Room, Database Design, Offline-first Architecture, API Integration

### Development Tools
Git, GitHub, Docker, Ollama, vLLM, Linux (Ubuntu), Pytest, Jupyter Notebooks, VS Code, Android Studio, MLflow, Hugging Face, Jest, ESLint, EAS (Expo), Web Scraping, Agile/Scrum

### Software Engineering
Clean Architecture, SOLID Principles, Agent Harness Engineering, Model Context Protocol (MCP), MCP Tool Servers & SDKs, TypeScript/Python Extension Adapters, Run Snapshot & Provenance Logging, Spec-First Architecture, FURPS+ Requirements Engineering, Log Triage & Flakiness Detection, Digital Signal Processing (DSP) for EDA, Distributed Saga Pattern & Compensating Transactions, Database-per-Service Architecture, Circuit Breaker Pattern, API Gateway Pattern & Perimeter Security, Test Impact Analysis (TIA) / RTS, Mutation Testing (Cosmic-Ray), Amdahl's Law Optimization, Cross-Version Runtime Fidelity, Coverage Execution Non-Determinism Analysis, NFS Locking & I/O Optimization, Performance Profiling & Bottleneck Optimization, Multiprocessing Worker Pools & Backpressure, Content-Addressed Caching, Copy-on-Write (COW) Data Pipelines, Size-Adaptive Dispatch Algorithms, Multi-Agent System Architecture, Structured Intermediate Representation (IR), Deterministic Rendering, Self-Healing / Self-Correction Loops, Fail-Fast Preflight Auditing, Dependency Injection, State Management, Object-Oriented Programming (OOP), Design Patterns, Search Engine Architecture, CRUD Applications, Entity Component System (ECS), Finite State Machines (FSM), Cascaded PID Control, Memory Stability & Lifecycle Management, ML Pipelines

### Data Science
Data Analysis, Exploratory Data Analysis (EDA), Feature Engineering, Feature Selection (Chi-square), Dimensionality Reduction (PCA), Welch's t-test (Side-Channel Analysis), Z-score & Behavioral Modeling, NLP Metrics (BLEU, ROUGE, WER, CER)

### Artificial Intelligence
Autonomous Multi-Agent Pipelines, Agent Harness Engineering, Model Context Protocol (MCP) Tooling, Multi-Model Agent Orchestration (Claude, Gemini, Groq), Local LLM Deployment (Ollama/vLLM), Agentic Self-Healing & Self-Correction Loops, Multi-Stage LLM Evaluation & Rubric Scoring, Kleene 3-Valued Logic Rule Engines, Chunkless RAG & Semantic Taxonomies, Physical-Envelope Constraint Layers, Verifiable Evidence & Safe Exit Protocols, Supervised Learning, Unsupervised Learning, Deep Learning (CNNs), 3D Medical Image Segmentation, Random Forest, Support Vector Machines (SVM), Clustering (DBSCAN, HDBSCAN), Hyperparameter Tuning, Cryptography (ARX, LEA Resistance, SAC/BIC), Post-Quantum Cryptography (PQC), Constraint Satisfaction, Multimodal AI Evaluation, Agentic Workflow Analysis, LLM-as-a-Judge

### Research Skills
Regression Test Selection (RTS) Research, Branch-Arc Execution Signatures, Mutation-Score Retention Analysis, Agentic Verification & Safety Protocols, RLVR & Self-Evolving Curricula (SEC), 40-Paper SOTA Review (LLM+CFD Systems), Systematic Benchmarking, Survey Design, Problem Validation, Market Research, Ideation, Data Collection, Literature Review

### Specialized Skills
Analog Waveform Parsing (PSF/RAW/SPICE), Variation-Aware IC Verification (PVT Corners, High-Sigma Monte Carlo), EDA Software QA Automation, Simulation Pipeline Automation (OpenFOAM C++ Case Generation), Static Dictionary Auditing & Parsing, Convergence Prediction (Residual Log-Slope Regression), Parallel Process Orchestration (MPI / Container Isolation), Operating Systems, Systems Programming (Process Management, IPC), Algorithms, Data Structures, Microprocessors, FPGA, Embedded C (Bare-Metal, Register-Level Drivers), Robot Simulation (Webots), Hash Function Design (BLAKE, Keccak, Skein), Quantum Algorithms (Shor's, Grover's), Post-Quantum Security Analysis, Intrusion Detection Systems (IDS), MUSE Framework (Dual-Metric Scoring), Side-Channel Timing Analysis, Game Engine Architecture, Computer Graphics, Video Decoding (FFmpeg), Audio Engineering

---

## Core Competencies

### Problem Solving
Analytical thinking, Critical thinking, Problem decomposition, Root cause identification, Decision making, Problem validation, Survey-based research

### Leadership
Team leadership, Technical mentoring, Session leadership, Learner guidance, Project coordination, Cross-functional collaboration, Agile teamwork

### Communication
Technical documentation, Stakeholder presentations, Code review, Knowledge transfer, Remote collaboration, Requirements clarification, Educational delivery, Survey design and analysis

### Continuous Learning
Technology adoption, Professional development, Industry best practices, Innovation, Self-directed learning, Rapid skill acquisition, Design thinking, Evidence-based ideation
