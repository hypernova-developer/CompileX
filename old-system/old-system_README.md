# CompileX Engine ⚙️

**CompileX** is the high-performance, minimalist compiler wrapper designed for developers who demand raw power and precision. Unlike its sibling Amour, CompileX strips away all emotional feedback to focus strictly on binary optimization and execution speed. It is the "Pure Performance" tool built within the SyntaX ecosystem.

## 🚀 Key Features

* **Advanced Optimization:** Automatically injects -O3 and -s (strip) flags to produce the smallest and fastest possible executables.
* **Multi-Language Core:** Native support for C++23, C, Fortran 90, and C# (.NET).
* **Industrial Output:** Minimalist, technical feedback designed for professional workflows.
* **Smart Artifact Management:** Keeps track of every binary created, allowing for a surgical cleanup operation without touching your other files.
* **Reliable Logging:** Maintains a detailed history of every compilation attempt for debugging and tracking.

## 🛠 Installation & Setup

### 1. Prerequisites
Ensure you have the necessary compilers installed on your system:
* MinGW-w64 (for C, C++, and Fortran)
* .NET SDK (for C#)
* Python Interpreter

### 2. Configuration
* Create a file named **compilex_config.bat** in the same directory as the script.
* Define your compiler paths and include directories inside this config file.
* Example: set GXX_PATH=C:\path\to\g++.exe
* Set your **SYNTAX_INCLUDE** path for custom library headers.

### 3. Environment Setup
* Add the directory containing **compilex.bat** to your System's **PATH** environment variable. This allows you to call the engine from any terminal window.

## 💻 Usage & Commands

To compile and run a file instantly, use the following syntax:
**compilex filename.cpp**

### Available Commands:
* **--version**: Check the current engine build and developer info.
* **--help**: Display the manual and command list.
* **--log**: Read the compilation history from compilex_history.log.
* **--clean**: Purge all binaries listed in .compilex_built from the current folder.

## 🏗 Developer Information

* **Developer:** hypernova-developer
* **Project Status:** Version v2.0.0 "Multi-Language Integration"
* **Environment:** Optimized for high-end systems.
* **Philosophy:** Speed, Efficiency, and Minimalist Execution.

---
*Developed by **hypernova-developer***
