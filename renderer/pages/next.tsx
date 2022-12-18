import React, { Fragment } from 'react';
import Head from 'next/head';
import Link from 'next/link';

function Next() {
  return (
    <Fragment>
      <Head>
        <title>Nextron - Next, TS, Tailwind</title>
      </Head>
      <div className='grid grid-col-1 text-2xl w-full text-center'>
        <img className='ml-auto mr-auto' src='/images/logo.png' />
        <span>⚡ Nextron ⚡</span>
      </div>
      <div className='mt-1 w-full flex-wrap flex justify-center'>
        <Link href='/home'>
          <a className='btn-blue'>Go to home page</a>
        </Link>
      </div>
    </Fragment>
  )
}

export default Next
