import { ConnectButton } from '@rainbow-me/rainbowkit';
import type { NextPage } from 'next';
import Head from 'next/head';

const Home: NextPage = () => {
  return (
    <div>
      <Head>
        <title>0xcacti webby</title>
        <meta
          content="Personal Website of 0xcacti"
          name="meow"
        />
        <link href="/favicon.ico" rel="icon" />
      </Head>

      <main >
        <h1 className="bg-green-300">poop</h1>
        <ConnectButton />

      </main>

    </div>
  );
};

export default Home;
