import Link from "next/link";
import { ConnectButton } from "@rainbow-me/rainbowkit";
import styles from "../styles/Projects.module.css";

export default function Projects() {
    return (
        <div className="mb-2 min-h-screen overflow-y-auto bg-white">
            <div className="container flex justify-between px-6 py-6 mx-auto">
                <Link href="/">
                    <a className="text-xl font-bold text-gray-800 md:text-2xl hover:text-red">
                        0xcacti
                    </a>
                </Link>
                <ConnectButton />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6 gap-1 mx-2 sm:px-24 md:px-20 lg:px-32">
                <Link href="/tictactoe">
                    <div className="h-80 min-w-64 bg-red min-w-fit rounded-lg flex flex-col justify-apart pt-4">
                        <div>
                            <div className={styles.boardContainer}>
                                <div className={styles.crossVerticalLeft}></div>
                                <div
                                    className={styles.crossVerticalRight}
                                ></div>
                                <div
                                    className={styles.crossHorizontalTop}
                                ></div>
                                <div
                                    className={styles.crossHorizontalBottom}
                                ></div>
                            </div>
                        </div>
                        <div className="border flex-grow flex flex-col items-center justify-center">
                            <h1 className="pt-4 text-center hoverText border align-center">
                                TicTacToe
                            </h1>
                        </div>
                    </div>
                </Link>

                <div className="h-80 min-w-64 bg-blue rounded-lg flex items-center justify-center">
                    2
                </div>
                <div className="h-80 bg-red rounded-lg flex items-center justify-center">
                    3
                </div>
                <div className="h-80 bg-blue rounded-lg flex items-center justify-center">
                    4
                </div>
                <div className="h-80 bg-red rounded-lg flex items-center justify-center">
                    5
                </div>
            </div>
        </div>
    );
}
