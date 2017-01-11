# DistilleryTest

For reproduction of bugs considering [this distillery issue](https://github.com/bitwalker/distillery/issues/171).

It seems that distillery only works properly with conform when the ERTS system
is included. Otherwise the release will crash on initialization. This can be
reproduced using

  `mix release --env=with_erts`

or respective

  `mix release --env=without_erts`

where the latter generated release will crash on startup because external
modules can't be accessed from the conform schema.

Note: The error changes when you remove the `_build` folder between building the
releases. Without removing the folder a crash dump message will pop up. If you
removed the folder in between then the following should be printed:

```
** (UndefinedFunctionError) function DistilleryTest.Conform.negate/1 is undefined (module DistilleryTest.Conform is not available)
    DistilleryTest.Conform.negate(false)
    (conform) lib/conform/translate.ex:183: Conform.Translate.apply_transforms/2
    (conform) lib/conform/translate.ex:95: Conform.Translate.apply_schema/2
    (conform) lib/conform/translate.ex:65: Conform.Translate.to_config/3
    (conform) lib/conform.ex:92: Conform.process/1
    (elixir) lib/kernel/cli.ex:76: anonymous fn/3 in Kernel.CLI.exec_fun/2
``` 

The mentioned module is of course not missing and is also used when the ERTS
system is included.
