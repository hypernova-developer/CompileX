## 🛡️ Part 1: Header & Features

# CompileX Engine ⚙️ (v3.0.0-LTS)

**CompileX** is a high-performance, C++ core compiler engine designed for developers who demand raw power, precision, and zero-dependency binaries. As the "Pure Power" heart of the SyntaX ecosystem, v3.0.0-LTS marks a major evolution: transitioning from a batch script to a standalone binary engine with integrated Raylib 5.5 graphics support and static linking capabilities.

## 🚀 Key Features (v3.0.0-LTS "Raylib Edition")

* **C++ Core Architecture:** Completely rewritten in C++ for maximum execution speed, replacing the legacy batch system.
* **Raylib 5.5 Native Integration:** Automatically links Raylib, OpenGL, and Windows GDI headers/libraries. Build high-performance graphics applications with zero extra flags.
* **"Nightmare-Slayer" (Standalone Binaries):** Injects `-static` flags to embed all necessary libraries within the executable. Say goodbye to "Missing DLL" errors on other machines.
* **Industrial Optimization:** Injects `-std=c++23`, `-O3` (Maximum Speed), and `-s` (Strip Symbols) to produce the smallest and fastest binaries possible.
* **Embedded Configuration:** All compiler paths and library directories are hardcoded into the engine kernel—no external `.bat` or `.config` files required for operation.
* **Multi-Language Support:** Native support for C++23, C, Fortran 90, C#, and Python.

## ⚔️ Part 2: Installation, Usage & Credits

## 🛠 Installation & Setup

### 1. The Power Source
CompileX v3.0.0 is a standalone engine. It is pre-configured for high-end development environments with the following structure:
* **MinGW-w64:** Located in `D:\mingw64\`
* **Raylib 5.5:** Located in `D:\Libraries\Raylib\`
* **SyntaX Headers:** Located in `E:\Developing\hypernova-developer\SyntaX\Fortran`

### 2. Building the Engine from Source
To deploy the engine binary, run this command in your terminal:
`g++ compilex_engine.cpp -o compilex.exe -std=c++23 -O3 -s -static`

### 3. Global Access
Add the directory containing your compiled `compilex.exe` to your System's **PATH** environment variable. This allows the engine to be summoned from any terminal instantly.

## 💻 Usage & Commands

To compile, link, and execute any source file instantly, use:
**`compilex <filename>.<ext>`**

### Available Commands:
* **`--version`**: Display the engine build (v3.0.0-LTS), developer info, and core focus.
* **`--log`**: Access the `compilex_history.log` to view a detailed history of all compilation operations.
* **`--clean`**: (Planned for v3.1) Surgical cleanup of generated binaries listed in `.compilex_built`.

## 🏗 Developer Information

* **Developer:** hypernova-developer
* **Project Status:** Version v3.0.0-LTS "C++ Core & Graphics Integration"
* **Hardware Target:** Optimized for high-end systems (i7-13700H verified).
* **Philosophy:** Pure Power, Zero Dependencies, Minimalist Execution.

---
*Developed by **hypernova-developer***
