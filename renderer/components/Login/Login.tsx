import React, { useEffect, useState } from 'react';
import { ILoginProps } from './Login.props';
import styles from './Login.module.scss';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';

export const Login = ({}: ILoginProps) => {
	const [login, setLogin] = useState('');
	const [password, setPassword] = useState('');

	useEffect(() => {
		console.log(`${login} ${password}`);
	}, [password, login]);

	return (
		<div className={styles.wrapper}>
			<Form>
				<Form.Group className="mb-3" controlId="formBasicEmail">
					<Form.Label>Почтовый адрес</Form.Label>
					<Form.Control type="login" placeholder="Введите ваш логин" onClick={(e) => saveData(e)} />
					<Form.Text className="text-muted">
						Мы не распространяем ваши персональные данные!
					</Form.Text>
				</Form.Group>

				<Form.Group className="mb-3" controlId="formBasicPassword">
					<Form.Label>Пароль</Form.Label>
					<Form.Control type="password" placeholder="Введите ваш пароль" />
				</Form.Group>
				<Form.Group className="mb-3" controlId="formBasicCheckbox">
					<Form.Check type="checkbox" label="Запомнить меня" />
				</Form.Group>
				<Button variant="primary" type="submit">
					Вход
				</Button>
			</Form>
		</div>
	);
};
