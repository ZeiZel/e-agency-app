import { DetailedHTMLProps, HTMLAttributes, ReactNode } from "react";

export interface ITitleBarProps extends DetailedHTMLProps<HTMLAttributes<HTMLDivElement>, HTMLDivElement> {
	children?: ReactNode;
}