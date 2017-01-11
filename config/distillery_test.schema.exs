[
  mappings: [
    "some.option": [
      datatype: :boolean,
      default: false,
      to: "distillery_test.some.option"
    ]
  ],
  transforms: [
    "distillery_test.some.option": fn table ->
      [{_, boolean}] = Conform.Conf.get(table, "distillery_test.some.option")
      DistilleryTest.Conform.negate(boolean)
    end,
  ],
]
