let spacing = length => Array.make(~length, " ")->Array.join("")
let getPadding = (props: TmuxJsx.Elements.props) => {
  switch props.padding {
  | None => {
      let paddingLeft = props.paddingLeft->Option.mapOr("", spacing)
      let paddingRight = props.paddingRight->Option.mapOr("", spacing)

      (paddingLeft, paddingRight)
    }
  | Some(value) => (spacing(value), spacing(value))
  }
}

let rec make = (node: Reconcilier.Tree.t, ~body="") => {
  let element = (~props, ~children) => {
    let (paddingLeft, paddingRight) = getPadding(props)
    let gap = props.gap->Option.mapOr("", spacing)
    let styles = props->Styles.inline
    let children = children->Array.reduceWithIndex("", (body, child, index) => {
      let middle = if index === 0 {
        ""
      } else {
        `${styles}${gap}`
      }

      `${body}${middle}${child->make}`
    })

    Console.log([styles, paddingLeft, children, paddingRight]->Array.join(""))
    [styles, paddingLeft, children, paddingRight]->Array.join("")
  }

  switch node {
  | Element(_, props, children) => element(~props, ~children)
  | TextElement(value) => `${body}${value->Obj.magic}`
  }
}
