type windowType = [
  | #active
  | #normal
]

type windowParams = {
  @as("type") type_: windowType,
  number: string,
  name: string,
}

type window = windowParams => TmuxJsx.element

type status = {
  bg?: string,
  left: option<TmuxJsx.element>,
  right: option<TmuxJsx.element>,
}

type config = {
  theme?: string,
  status?: status,
  window?: window,
}

type mod = {default: config}

@val external import_: string => promise<mod> = "import"
