import type { NextPage } from "next";
import { ConnectButton } from "@rainbow-me/rainbowkit";
import Link from "next/link";
import styles from "../styles/TicTacToe.module.css";

const Home: NextPage = () => {
    return (
        <div className="bg-white border min-h-screen">
            <div className="container flex justify-between px-6 py-10 container mx-auto">
                <Link href="/projects">
                    <a className="text-xl font-bold text-gray-800 md:text-2xl hover:text-red">
                        Projects
                    </a>
                </Link>
                <ConnectButton />
            </div>
            <div className="flex flex-col h-screen border border-red mx-auto justify-center">
                <div
                    className="flex flex-col  h-2/3 w-1/3"
                    style={{ height: "600px", width: "600px" }}
                >
                    <div className={styles.boardContainer}>
                        <div className={styles.crossVerticalLeft}></div>
                        <div className={styles.crossVerticalRight}></div>
                        <div className={styles.crossHorizontalTop}></div>
                        <div className={styles.crossHorizontalBottom}></div>

                        <div className={styles.o00}></div>
                        <div className={styles.o01}></div>
                        <div className={styles.o21}></div>
                        <div className={styles.o22}></div>
                        <div className={styles.x02Left}></div>
                        <div className={styles.x02Right}></div>
                        <div className={styles.x10Left}></div>
                        <div className={styles.x10Right}></div>
                        <div className={styles.x11Left}></div>
                        <div className={styles.x11Right}></div>
                        <div className={styles.x12Left}></div>
                        <div className={styles.x12Right}></div>
                        <div className={styles.x20Left}></div>
                        <div className={styles.x20Right}></div>
                    </div>
                </div>
                <div className="flex flex-row space-y-16 justify-center text-center p-5 h-2/3">
                    <div className="bg-blue p-2 rounded-lg">
                        <h1 className="text-xl font-bold">New Game</h1>
                    </div>
                    <div className="bg-red p-2 rounded-lg">
                        <h1 className="text-xl font-bold">Find Game</h1>
                    </div>
                    <div className="bg-blue p-2 rounded-lg">
                        <h1 className="text-xl font-bold">Mint Game</h1>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Home;
