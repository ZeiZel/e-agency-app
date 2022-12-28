import React from 'react';
import styles from './TitleBar.module.scss';
import Image from 'next/image';
import { ITitleBarProps } from './TitleBar.props';

export const TitleBar = ({ children, ...props }: ITitleBarProps) => {
	return (
		<div className={styles.titleBar}>
			<div className={styles.titleBox}></div>
			<div className={styles.titleBarName}>{children}</div>
			<div className={styles.buttonBox}></div>
		</div>
	);
};
