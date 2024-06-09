module Tree = {
  type prop = {
    name: string,
    value: string,
  }

  type rec t =
    | Element(string, TmuxJsx.Elements.props, array<t>)
    | TextElement(Jsx.element)
}

type renderType = StatusLeft | StatusRight

type root = {
  renderType: renderType,
  mount: Tree.t => unit,
}

module Roots = {
  module Styles = {
    let toString = (styles: TmuxJsx.Elements.style) => {
      let makeProp = (~name, value) => value->Option.mapOr("", v => `${name}=${v}`)
      let makeBoolProp = (~name, value) => value->Option.mapOr("", v => v ? name : "")

      let bg = makeProp(~name="bg", styles.bg)
      let fg = makeProp(~name="fg", styles.fg)
      let bold = makeBoolProp(~name="bold", styles.bold)

      [bg, fg, bold]
      ->Array.filter(v => v !== "")
      ->Array.join(",")
    }

    let inline = styles => `#[${toString(styles)}]`
  }

  let rec toString = (node: Tree.t, content) => {
    switch node {
    | Element(_, props, children) => {
        let styles = props.style->Option.mapOr("", Styles.inline)
        let children = children->Array.reduce("", (acc, child) => `${acc}${child->toString("")}`)
        `${styles}${children}`
      }
    | TextElement(value) => `${content}${value->Obj.magic}`
    }
  }
  let statusLeft: root = {
    renderType: StatusLeft,
    mount: tree => {
      let content = toString(tree, "")
      Console.log(content)
      Tmux.exec(SetGlobal(StatusLeft(content)))
    },
  }
}

module Reconcilier = ReactReconcilier.Make({
  type root = root
  type componentElement = Tree.t
  type props = TmuxJsx.Elements.props
})

let reconcilier = Reconcilier.create({
  getRootHostContext: () => {isInsideText: false},
  appendChildToContainer: (parent, child) => {
    parent.mount(child)
  },
  appendInitialChild: (parent, child) => {
    switch parent {
    | Element(_, _, children) => children->Array.push(child)
    | _ => ()
    }
  },
  createInstance: (name, props, _) => {
    Element(name, props, [])
  },
  createTextInstance: text => TextElement(text),
  prepareUpdate: (_, __, _, _) => {
    Console.log("prepareUpdate")
    Obj.magic()
  },
  commitUpdate: (_, _) => {
    Console.log("commitUpdate")
  },
  commitTextUpdate: (_, _, _) => {
    Console.log("commitTextUpdate")
  },
  appendChild: (_, _) => {
    Console.log("appendChild")
    Obj.magic()
  },
  getChildHostContext: () => Obj.magic(),
  shouldSetTextContent: () => Obj.magic(),
  prepareForCommit: () => Obj.magic(),
  preparePortalMount: () => Obj.magic(),
  clearContainer: () => Obj.magic(),
  resetAfterCommit: () => Obj.magic(),
  resetTextContent: () => Obj.magic(),
  hideTextInstance: () => Obj.magic(),
  unhideTextInstance: () => Obj.magic(),
  getPublicInstance: () => Obj.magic(),
  hideInstance: _ => Obj.magic(),
  unhideInstance: () => Obj.magic(),
  insertBefore: (_, _, _) => Obj.magic(),
  finalizeInitialChildren: () => Obj.magic(),
  getCurrentEventPriority: () => Obj.magic(),
  beforeActiveInstanceBlur: () => Obj.magic(),
  afterActiveInstanceBlur: () => Obj.magic(),
  detachDeletedInstance: () => Obj.magic(),
  getInstanceFromNode: () => Obj.magic(),
  prepareScopeUpdate: () => Obj.magic(),
  getInstanceFromScope: () => Obj.magic(),
  insertInContainerBefore: () => Obj.magic(),
  removeChildFromContainer: () => Obj.magic(),
  removeChild: _ => Obj.magic(),
  isPrimaryRenderer: true,
  supportsMutation: true,
  supportsPersistence: false,
  supportsHydration: false,
  scheduleTimeout: Js.Global.setTimeout->Obj.magic,
  cancelTimeout: Js.Global.clearTimeout->Obj.magic,
  noTimeout: -1,
})

let render = (app, root) => {
  let container =
    reconcilier->Reconcilier.createContainer(
      root,
      0,
      Js.Nullable.null,
      false,
      Js.Nullable.null,
      "id",
      () => Js.Nullable.null,
      null,
    )
  reconcilier->Reconcilier.updateContainer(app, container, Js.Nullable.null, () => Js.Nullable.null)
}

type config = {statusLeft: TmuxJsx.element}

let defineConfig = config => {
  render(config.statusLeft, Roots.statusLeft)
}
