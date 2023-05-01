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

            <div className="w-screen flex-col border border-indigo-600 space-y-5 py-12 px-32">
                <div className="w-full flex space-x-5 flex-row border border-green-300 justify-start">
                    <div className="flex flex-col justify-apart">
                        <div className="h-80 w-64 rounded-lg bg-red group-hover:opacity-75 relative pt-8 text-center">
                            <div>
                                <div className={styles.boardContainer}>
                                    <div
                                        className={styles.crossVerticalLeft}
                                    ></div>
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
                                <h1 className="pt-4 hidden hoverText ">
                                    TicTacToe
                                </h1>
                            </div>
                        </div>
                    </div>

                    <div className="h-80 w-64 rounded-lg bg-blue  group-hover:opacity-75">
                        <div className="container">
                            <div className="crossVerticalLeft"></div>
                            <div className="crossVerticalRight"></div>
                            <div className="crossHorizontalTop"></div>
                            <div className="crossHorizontalBottom"></div>
                        </div>
                    </div>
                </div>
                <div className="w-full flex-row border border-green-300 justify-start"></div>
            </div>
        </div>
    );
}
