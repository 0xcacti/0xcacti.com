import "../styles/globals.css";
import "@rainbow-me/rainbowkit/styles.css";
import {
    getDefaultWallets,
    RainbowKitProvider,
    lightTheme,
} from "@rainbow-me/rainbowkit";
import type { AppProps } from "next/app";
import { configureChains, createClient, WagmiConfig } from "wagmi";
import {
    arbitrum,
    goerli,
    mainnet,
    optimism,
    polygon,
    localhost,
} from "wagmi/chains";
import { publicProvider } from "wagmi/providers/public";

const { chains, provider, webSocketProvider } = configureChains(
    [
        mainnet,
        polygon,
        optimism,
        arbitrum,
        localhost,
        ...(process.env.NEXT_PUBLIC_ENABLE_TESTNETS === "true" ? [goerli] : []),
    ],
    [publicProvider()]
);

const { connectors } = getDefaultWallets({
    appName: "RainbowKit App",
    projectId: "YOUR_PROJECT_ID",
    chains,
});

const wagmiClient = createClient({
    autoConnect: true,
    connectors,
    provider,
    webSocketProvider,
});

function MyApp({ Component, pageProps }: AppProps) {
    return (
        <WagmiConfig client={wagmiClient}>
            <RainbowKitProvider
                chains={chains}
                theme={lightTheme({
                    accentColor: "#B5CCBA",
                    accentColorForeground: "#3B3D3C",
                    borderRadius: "small",
                    fontStack: "system",
                    overlayBlur: "small",
                })}
            >
                <Component {...pageProps} />
            </RainbowKitProvider>
        </WagmiConfig>
    );
}

export default MyApp;
