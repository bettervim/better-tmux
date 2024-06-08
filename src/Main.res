Console.log("Hey :)")

module Reconcilier = {
  type t
  type componentElement
  type root
  type payload
  type context
  type defaultEventPriority

  type hostContext = {isInsideText: bool}

  type createParams<'props> = {
    getRootHostContext: unit => hostContext,
    appendChildToContainer: (componentElement, componentElement) => unit,
    appendInitialChild: (componentElement, componentElement) => unit,
    createInstance: (string, 'props, root) => componentElement,
    createTextInstance: (string, root) => componentElement,
    prepareUpdate: (componentElement, string, 'props, 'props) => payload,
    commitUpdate: (componentElement, payload) => unit,
    commitTextUpdate: (componentElement, string, string) => unit,
    appendChild: (componentElement, componentElement) => unit,
    getChildHostContext: unit => option<context>,
    shouldSetTextContent: unit => option<bool>,
    prepareForCommit: unit => option<unit>,
    preparePortalMount: unit => unit,
    clearContainer: unit => unit,
    resetAfterCommit: unit => unit,
    resetTextContent: unit => unit,
    hideTextInstance: unit => unit,
    unhideTextInstance: unit => unit,
    getPublicInstance: unit => option<unit>,
    hideInstance: array<unit> => unit,
    unhideInstance: unit => unit,
    insertBefore: (componentElement, componentElement, componentElement) => unit,
    finalizeInitialChildren: unit => bool,
    getCurrentEventPriority: unit => defaultEventPriority,
    beforeActiveInstanceBlur: unit => unit,
    afterActiveInstanceBlur: unit => unit,
    detachDeletedInstance: unit => unit,
    getInstanceFromNode: unit => option<unit>,
    prepareScopeUpdate: unit => unit,
    getInstanceFromScope: unit => option<unit>,
    insertInContainerBefore: unit => unit,
    removeChildFromContainer: unit => unit,
    removeChild: array<unit> => unit,
    isPrimaryRenderer: bool,
    supportsMutation: bool,
    supportsPersistence: bool,
    supportsHydration: bool,
    scheduleTimeout: (unit => unit, int) => int,
    cancelTimeout: int => unit,
    noTimeout: int,
  }

  @module("react-reconciler")
  external create: createParams<{..}> => t = "default"

  type container

  @send
  external createContainer: (
    t,
    root,
    int,
    Js.Nullable.t<string>,
    bool,
    Js.Nullable.t<string>,
    string,
    unit => Js.Nullable.t<string>,
    Js.Nullable.t<string>,
  ) => container = "createContainer"

  type app = Jsx.element

  @send
  external updateContainer: (
    t,
    app,
    container,
    Js.Nullable.t<string>,
    unit => Js.Nullable.t<string>,
  ) => unit = "updateContainer"
}


let reconcilier = Reconcilier.create({
  getRootHostContext: () => {isInsideText: false},
  appendChildToContainer: (_, _) => {
    Console.log("appendChildToContainer.")
  },
  appendInitialChild: (_, _) => {
    Console.log("appendInitialChild")
  },
  createInstance: (name, _, _) => {
    Console.log2("createInstance", name)
    Obj.magic()
  },
  createTextInstance: (_, _) => {
    Console.log("createTextInstance")
    Obj.magic()
  },
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
  preparePortalMount: () =>  Obj.magic(),
  clearContainer: () => Obj.magic(),
  resetAfterCommit: () => Obj.magic(),
  resetTextContent:() => Obj.magic(),
  hideTextInstance:() => Obj.magic(),
  unhideTextInstance: () => Obj.magic(),
  getPublicInstance: () => Obj.magic(),
  hideInstance: (_) => Obj.magic(),
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
  removeChild: (_) => Obj.magic(),
  isPrimaryRenderer: true,
  supportsMutation: true,
  supportsPersistence: false,
  supportsHydration: false,
  scheduleTimeout: Js.Global.setTimeout->Obj.magic,
  cancelTimeout: Js.Global.clearTimeout->Obj.magic,
  noTimeout: -1,

})


let render = (app, root) => {
  let container = reconcilier->Reconcilier.createContainer(
    root,
    0,
    Js.Nullable.null,
    false,
    Js.Nullable.null,
    "id",
    () => Js.Nullable.null,
    null  
  )
  reconcilier->Reconcilier.updateContainer(app, container, Js.Nullable.null, () => Js.Nullable.null)
}


render(<div qlqcoisa="test..." />, Obj.magic({ "mount": ignore }))
