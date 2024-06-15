import { ReactNode } from "react"

export type ElementProps = {
  padding?: number,
  paddingLeft?: number,
  paddingRight?: number,
  gap?: number,
  bold?: boolean,
  bg?: string,
  fg?: string,
  children: ReactNode,
}

export const Box = ({ children, ...props}: ElementProps) => (
  <box {...props}>{children}</box>
)

export const Text = ({ children, ...props}: ElementProps) => (
  <text {...props}>{children}</text>
)
