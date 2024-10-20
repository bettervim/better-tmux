import { tmux } from "../tmux.js";
import { Widget, WidgetIcon, WidgetLabel } from "./widget.js";
export * from "./widget.js";

type CommonModuleProps = {
  icon?: string;
};

type HostnameProps = CommonModuleProps;

export const Hostname = ({ icon }: HostnameProps) => {
  return (
    <Widget>
      <WidgetIcon>{icon ?? ""}</WidgetIcon>
      <WidgetLabel>{tmux.globals.hostname}</WidgetLabel>
    </Widget>
  );
};

type SessionNameProps = CommonModuleProps;

export const SessionName = ({ icon }: SessionNameProps) => {
  return (
    <Widget>
      <WidgetIcon>{icon ?? ""}</WidgetIcon>
      <WidgetLabel>{tmux.globals.sessionName}</WidgetLabel>
    </Widget>
  );
};

type ClockProps = CommonModuleProps & {
  format?: string;
};

export const Clock = ({ format, icon }: ClockProps) => {
  const value = format ?? `${tmux.globals.hour_24}:${tmux.globals.minute}`;

  return (
    <Widget>
      <WidgetIcon>{icon ?? ""}</WidgetIcon>
      <WidgetLabel>{value}</WidgetLabel>
    </Widget>
  );
};

type CalendarProps = CommonModuleProps & {
  format?: string;
};

export const Calendar = ({ format, icon }: CalendarProps) => {
  const value =
    format ?? `${tmux.globals.month}-${tmux.globals.day}-${tmux.globals.year}`;

  return (
    <Widget>
      <WidgetIcon>{icon ?? ""}</WidgetIcon>
      <WidgetLabel>{value}</WidgetLabel>
    </Widget>
  );
};
