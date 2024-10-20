import type { Theme } from './types.ts'
import type { ElementProps } from "./components.tsx"

declare global {
  namespace JSX {
    // eslint-disable-next-line @typescript-eslint/consistent-type-definitions
    interface IntrinsicElements {
      'text': ElementProps,
      'box': ElementProps
    }
  }

  declare namespace NodeJS {
    interface ProcessEnv {
      BETTER_TMUX_THEME: Theme
    }
  }
}
