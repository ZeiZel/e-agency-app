import React, { Fragment } from 'react';
import Head from 'next/head';
import Link from 'next/link';

function Home() {
  return (
    <Fragment>
      <Head>
        <title>Nextron - Next, TS, Tailwind</title>
      </Head>
      <div className='grid grid-col-1 text-2xl w-full text-center'>
        <img className='ml-auto mr-auto' src='/images/logo.png' />
        <span>⚡ Electron - Nextron ⚡</span>
        <span>Do you like React + Next.js + Tailwind?</span>
      </div>
      <div className='mt-1 w-full flex-wrap flex justify-center'>
        <Link href='/next'>
          <a className='btn-blue'>Go to next page</a>
        </Link>
      </div>
    </Fragment>
  );
}

export default Home;
