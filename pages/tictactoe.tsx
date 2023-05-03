import type { NextPage } from "next";
import { ConnectButton } from "@rainbow-me/rainbowkit";
import Link from "next/link";

const Home: NextPage = () => {
    return (
        <div className="bg-white border min-h-screen">
            <div className="container flex justify-between px-6 py-6 container mx-auto">
                <Link href="/">
                    <a className="text-xl font-bold text-gray-800 md:text-2xl hover:text-red">
                        0xcacti
                    </a>
                </Link>
                <ConnectButton />
            </div>
            <div className="flex flex-row h-screen border border-red mx-auto justify-center">
                <div
                    className="flex flex-col border border-blue h-2/3 w-1/3"
                    style={{ height: "600px", width: "600px" }}
                >
                    meow
                </div>
                <div className="border border-black text-center p-5">
                    <div className="border bg-blue p-2">
                        <h1>New Game</h1>
                    </div>
                    <div className="border bg-red p-2">
                        <h1>Find / Mint Existing Game</h1>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Home;
