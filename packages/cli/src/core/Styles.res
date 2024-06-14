let toString = (styles: TmuxJsx.Elements.props) => {
  let str = (~name, value) => value->Option.mapOr("", v => `${name}=${v}`)
  let bool = (~name, value) => value->Option.mapOr("", v => v ? name : "")

  let bg = str(~name="bg", styles.bg)
  let fg = str(~name="fg", styles.fg)
  let bold = bool(~name="bold", styles.bold)

  [bg, fg, bold]
  ->Array.filter(v => v !== "")
  ->Array.join(",")
}

let inline = styles => `#[${toString(styles)}]`
