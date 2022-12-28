import Document, {
	Html,
	Head,
	Main,
	NextScript,
	DocumentContext,
	DocumentInitialProps,
} from 'next/document';

export default class MyDocument extends Document {
	static async getInitialProps(context: DocumentContext): Promise<DocumentInitialProps> {
		const initialProps = await Document.getInitialProps(context);
		return { ...initialProps };
	}

	render() {
		return (
			<Html lang="ru">
				<Head>
					<link rel="preconnect" href="https://fonts.googleapis.com" />
					<link rel="preconnect" href="https://fonts.gstatic.com" />
					<link
						href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;400;500;600;700&display=swap"
						rel="stylesheet"
					/>
				</Head>
				<body className="someClass">
					<Main />
					<NextScript />
				</body>
			</Html>
		);
	}
}
