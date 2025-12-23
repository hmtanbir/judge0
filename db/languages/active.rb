@languages ||= []
@languages +=
[
  {
    id: 90,
    name: "C (gcc 14.0.0)",
    is_archived: false,
    source_file: "main.c",
    compile_cmd: "/opt/gcc-14/bin/gcc main.c",
    run_cmd: "./a.out"
  },
  {
    id: 91,
    name: "C++ (Clang 19.0.0)",
    is_archived: false,
    source_file: "main.cpp",
    compile_cmd: "/usr/bin/clang++ main.cpp",
    run_cmd: "./a.out"
  },
  {
    id: 92,
    name: "Java (OpenJDK 25.0.1)",
    is_archived: false,
    source_file: "Main.java",
    compile_cmd: "javac Main.java",
    run_cmd: "java Main"
  },
  {
    id: 93,
    name: "Python (2.7.18)",
    is_archived: false,
    source_file: "main.py",
    run_cmd: "/usr/local/bin/python main.py"
  },
  {
    id: 94,
    name: "Python (3.11)",
    is_archived: false,
    source_file: "main.py",
    run_cmd: "/usr/bin/python3 main.py"
  },
  {
    id: 95,
    name: "JavaScript (Node.js 22.14.0)",
    is_archived: false,
    source_file: "script.js",
    run_cmd: "/usr/bin/node script.js"
  },
  {
    id: 96,
    name: "TypeScript (5.7.3)",
    is_archived: false,
    source_file: "script.ts",
    compile_cmd: "/usr/bin/tsc %s script.ts",
    run_cmd: "/usr/bin/node script.js"
  },
  {
    id: 97,
    name: "Go (1.23)",
    is_archived: false,
    source_file: "main.go",
    compile_cmd: "/usr/local/go/bin/go build main.go",
    run_cmd: "./main"
  },
  {
    id: 98,
    name: "Kotlin (2.1.10)",
    is_archived: false,
    source_file: "Main.kt",
    compile_cmd: "/opt/kotlinc/bin/kotlinc Main.kt",
    run_cmd: "/opt/kotlinc/bin/kotlin MainKt"
  },
  {
    id: 99,
    name: "C# (.NET 9)",
    is_archived: false,
    source_file: "Main.csx",
    run_cmd: "/opt/dotnet/dotnet script Main.csx"
  },
  {
    id: 100,
    name: "Rust (1.88.0)",
    is_archived: false,
    source_file: "main.rs",
    compile_cmd: "/opt/cargo/bin/rustc main.rs",
    run_cmd: "./main"
  },
  {
    id: 101,
    name: "Ruby (3.2.0)",
    is_archived: false,
    source_file: "script.rb",
    run_cmd: "/usr/local/bin/ruby script.rb"
  },
  {
    id: 102,
    name: "Swift (66.0)",
    is_archived: false,
    source_file: "Main.swift",
    compile_cmd: "/usr/local/swift/bin/swiftc Main.swift",
    run_cmd: "./Main"
  },
  {
    id: 103,
    name: "PHP (8.2)",
    is_archived: false,
    source_file: "script.php",
    run_cmd: "/usr/bin/php script.php"
  }
]