# Knowledges
## My way to development
### Ruby
Use `rbenv`.

### Common Lisp
Execute in Atom's `slime` or use `sbcl` or `clisp`.
TODO: Detailed way to call our programs.

### Python
*   Environment
    1.  Install `Anaconda` through `pyenv` to avoid to conflict with
        the system's default Python.
    2.  Use `conda` to create virtual environments and manage packages.

### Scala
*   Create a new project.
    1.  `sbt new scala/scala-seed.g8` -> Enter project's name.
        The project folder is created automatically.
    2.  `sbt ensimeConfig`.

*   Edit.
    1.  In Atom, do `Ensime: Start`.
    2.  Execute the program with `sbt run`.

### OCaml
*   Install and manage packages.
    *   Use `OPAM`.
*   Execute
    *   Call by `#use "filename.ml"` in `utop`.
*   Quit `utop`
    *   `exit 0;;`

### Scheme
Use `Dr.Racket`?
TODO:
