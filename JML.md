<!--
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements. See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to You under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License. You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

# Using JML and OpenJML with this project

This document explains how to download and run OpenJML to verify JML annotations in this repository.

## Quick start (Windows / PowerShell)

1. Install Maven and Java (this project targets Java 8).
2. Download OpenJML (default version used by script is 1.3.0):
   - PowerShell: `tools\openjml\install-openjml.ps1`
     - Example: `.	ools\openjml\install-openjml.ps1 -Version 1.3.0`
3. Run OpenJML in ESC (static verification) mode:
   - `.	ools\openjml\run-openjml.ps1 -Mode -esc`
   - For runtime assertion checks (RAC): `.	ools\openjml\run-openjml.ps1 -Mode -rac`

## Maven integration

A Maven plugin invocation is provided (disabled by default). To run OpenJML as part of the Maven lifecycle:

- Enable the `openjml` profile: `mvn verify -Popenjml`

Or run the scripts above which will build the project and then run OpenJML on the example sources.

## Adding JML annotations

- Add JML annotations using `//@` single-line or `/*@ ... @*/` block comments immediately before method declarations.
- See `src/main/java/org/apache/commons/collections4/jmlexamples/Examples.java` for a minimal example.

## CI

A GitHub Actions workflow has been added: `.github/workflows/openjml.yml`.

- The workflow tries to download an OpenJML JAR from the repository releases (version controlled by `OPENJML_VERSION` in the workflow).
- If that fails it attempts a Maven-copy fallback.
- The workflow runs `mvn -Popenjml verify` and will fail the job if OpenJML verification fails.

You can change the OpenJML release by editing the workflow `OPENJML_VERSION` environment variable.
