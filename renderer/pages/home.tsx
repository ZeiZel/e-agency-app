import React, { Fragment } from 'react';
import Head from 'next/head';
import Link from 'next/link';
import { Container, Row, Col } from 'react-bootstrap';
import { Login, TitleBar } from '../components';
import Meta from '../components/utilities/Meta/Meta';

function Home() {
	return (
		<>
			<Meta title="Главная" description="Описание страницы" />
			<TitleBar>Главная</TitleBar>
			<Login />
		</>
	);
}

export default Home;
