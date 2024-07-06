import { PropsWithChildren } from "react"
import { useTheme } from "../hooks/use-theme.js"

export const Widget = ({ children }: PropsWithChildren) => {
  const theme = useTheme()

  return (
    <box bg={theme.background}>
      {children}
    </box>
  )
}

export const WidgetIcon = ({ children }: PropsWithChildren) => {
  const theme = useTheme()

  return (
    <box padding={1} bg={theme.primary} fg={theme.background}>
      {children}
    </box>
  )
}

export const WidgetLabel = ({ children }: PropsWithChildren) => {
  const theme = useTheme()

  return (
    <box padding={1} bg={theme.background} fg={theme.foreground}>
      {children}
    </box>
  )
}
