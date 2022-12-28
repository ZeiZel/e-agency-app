import Head from 'next/head';
import { IMetaProps } from './Meta.props';

const Meta = ({ title, description }: IMetaProps) => {
	return (
		<Head>
			<title>{title}</title>
			<meta name="description" content={description} />
		</Head>
	);
};

export default Meta;
