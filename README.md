# Standalone FitSpec paper examples

This is a small Cabal project containing the FitSpec examples from the
uploaded paper that can be made standalone without importing one of the
paper's external case-study libraries.

## Included

| Executable                  | Paper material                                                                                   |
| --------------------------- | ------------------------------------------------------------------------------------------------ |
| `example-2-not-incomplete`  | Example 2: incomplete `not` specification                                                        |
| `example-3-not-equivalence` | Example 3: equivalent/non-equivalent `not` specifications                                        |
| `example-4-not-implication` | Example 4: implication between `not` specifications                                              |
| `example-5-not-minimality`  | Example 5: non-minimal `not` specification                                                       |
| `example-1-sort-refined`    | Example 1 revisited: refined `sort` specification                                                |
| `example-6-listable-bool`   | Example 6: `Listable Bool`                                                                       |
| `example-7-listable-nat`    | Example 7: `Listable Nat`                                                                        |
| `example-8-listable-list`   | Example 8: `Listable [a]`                                                                        |
| `example-9-listable-tree`   | Example 9: `Listable Tree`                                                                       |
| `example-10-not-mutants`    | Example 10: the three `not` mutants, written explicitly                                          |
| `example-11-id-mutants`     | Example 11: the first four `id` mutants, written explicitly                                      |
| `example-12-add-mutants`    | Example 12: the first three natural-number addition mutants, written explicitly                  |
| `application-boolean`       | §5.1 Boolean operators                                                                           |
| `application-id`            | A runnable FitSpec property-map version of the paper's `id` mutant discussion                    |
| `application-add`           | A runnable FitSpec property-map version of the paper's natural-number addition mutant discussion |

The paper's Heap, Set, Powerset/Partitions, and Digraph applications are
**not** included as FitSpec runs because the paper relies on external
libraries and their definitions/invariants. Reconstructing those libraries
would no longer be extracting the standalone examples from the paper.

## Requirements

Current FitSpec documentation lists version 0.4.10 and says that with
Cabal >= 3.0 the library should be installed with:

```text
cabal install fitspec --lib
```

Then build the whole project:

```text
cabal build all
```

## Running the examples

Each example is a separate executable, so you can run them individually with
`cabal run`.

### Examples 1–5: specifications

Example 1 — refined `sort` specification:

```text
cabal run example-1-sort-refined
```

Example 2 — incomplete `not` specification:

```text
cabal run example-2-not-incomplete
```

Example 3 — equivalent/non-equivalent specifications:

```text
cabal run example-3-not-equivalence
```

Example 4 — implication between specifications:

```text
cabal run example-4-not-implication
```

Example 5 — non-minimal specification:

```text
cabal run example-5-not-minimality
```

### Examples 6–9: `Listable`

Example 6 — `Listable Bool`:

```text
cabal run example-6-listable-bool
```

Example 7 — `Listable Nat`:

```text
cabal run example-7-listable-nat
```

Example 8 — `Listable [a]`:

```text
cabal run example-8-listable-list
```

Example 9 — `Listable Tree`:

```text
cabal run example-9-listable-tree
```

### Examples 10–12: mutants

Example 10 — `not` mutants:

```text
cabal run example-10-not-mutants
```

Example 11 — `id` mutants:

```text
cabal run example-11-id-mutants
```

Example 12 — natural-number addition mutants:

```text
cabal run example-12-add-mutants
```

### §5 applications

Boolean operators:

```text
cabal run application-boolean
```

`id` mutant/property-map application:

```text
cabal run application-id
```

Natural-number addition mutant/property-map application:

```text
cabal run application-add
```

## Run every example

If you want to run all 15 executables one after another, use the following
commands.

### PowerShell

```powershell
cabal run example-1-sort-refined
cabal run example-2-not-incomplete
cabal run example-3-not-equivalence
cabal run example-4-not-implication
cabal run example-5-not-minimality
cabal run example-6-listable-bool
cabal run example-7-listable-nat
cabal run example-8-listable-list
cabal run example-9-listable-tree
cabal run example-10-not-mutants
cabal run example-11-id-mutants
cabal run example-12-add-mutants
cabal run application-boolean
cabal run application-id
cabal run application-add
```

You can also build everything first and then run individual executables:

```powershell
cabal build all
```

followed by whichever example you want to inspect.

## Quick reference

| Example                       | Command                               |
| ----------------------------- | ------------------------------------- |
| Example 1 — refined sort      | `cabal run example-1-sort-refined`    |
| Example 2 — incomplete not    | `cabal run example-2-not-incomplete`  |
| Example 3 — not equivalence   | `cabal run example-3-not-equivalence` |
| Example 4 — not implication   | `cabal run example-4-not-implication` |
| Example 5 — not minimality    | `cabal run example-5-not-minimality`  |
| Example 6 — `Listable Bool`   | `cabal run example-6-listable-bool`   |
| Example 7 — `Listable Nat`    | `cabal run example-7-listable-nat`    |
| Example 8 — `Listable [a]`    | `cabal run example-8-listable-list`   |
| Example 9 — `Listable Tree`   | `cabal run example-9-listable-tree`   |
| Example 10 — `not` mutants    | `cabal run example-10-not-mutants`    |
| Example 11 — `id` mutants     | `cabal run example-11-id-mutants`     |
| Example 12 — addition mutants | `cabal run example-12-add-mutants`    |
| Boolean application           | `cabal run application-boolean`       |
| `id` application              | `cabal run application-id`            |
| Addition application          | `cabal run application-add`           |

## Notes

The paper's reported runtimes, mutant counts, and survivor lists were
obtained on the 2016-era environment described in the paper. They should
not be expected to match a modern GHC/FitSpec installation exactly.

The examples intentionally use the current FitSpec API (`mainWith`) where
the current package documentation differs from the 2016 paper's older
`reportWith` spelling.
