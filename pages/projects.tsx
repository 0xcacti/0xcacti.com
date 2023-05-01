import Link from "next/link";
import { ConnectButton } from "@rainbow-me/rainbowkit";
import "../styles/Projects.module.css";

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

            <div className="w-screen flex-col border border-indigo-600 space-y-5 p-32">
                <div className="w-full flex-row border border-green-300 justify-start">
                    <div className="h-80 w-64 rounded bg-red group-hover:opacity-75">
                        <div className="container">
                            <div className="crossVerticalLeft"></div>
                            <div className="crossVerticalRight"></div>
                            <div className="crossHorizontalTop"></div>
                            <div className="crossHorizontalBottom"></div>
                        </div>
                    </div>
                </div>
                <div className="w-full flex-row border border-green-300 justify-start">
                    <div className="group relative">
                        <div className="min-h-80 rounded-lg bg-blue lg:aspect-none group-hover:opacity-75">
                            <div className="container">
                                <div className="crossVerticalLeft"></div>
                                <div className="crossVerticalRight"></div>
                                <div className="crossHorizontalTop"></div>
                                <div className="crossHorizontalBottom"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
