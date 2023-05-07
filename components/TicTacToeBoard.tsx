import { BigNumber } from "@ethersproject/bignumber";
import styles from "../styles/TicTacToe.module.css";
import { useContractRead } from "wagmi";
import { erc721ABI } from "wagmi";
import contractConfig from "../contracts/TicTacToe.json";

interface DisplayDataProps {
    refreshData: () => void;
    tokenID: number;
}

const TicTacToeBoard: React.FC<DisplayDataProps> = ({ tokenID }) => {
    const { data, isError, isLoading } = useContractRead({
        address: contractConfig.address as `0x${string}`,
        abi: contractConfig.abi,
        functionName: "retrieveAllGameInfo",
        args: [BigNumber.from(tokenID)],
    });

    // if (isLoading) return <div>Loading...</div>;
    if (isError)
        return (
            <div>
                Error {isError} - {data}
            </div>
        );

    return (
        <div className={styles.boardContainer}>
            <div className={styles.crossVerticalLeft}></div>
            <div className={styles.crossVerticalRight}></div>
            <div className={styles.crossHorizontalTop}></div>
            <div className={styles.crossHorizontalBottom}></div>
            {data}
            {/* <div className={styles.o00}></div>
        <div className={styles.o01}></div>
        <div className={styles.o02}></div>
        <div className={styles.o10}></div>
        <div className={styles.o11}></div>
        <div className={styles.o12}></div>
        <div className={styles.o20}></div>
        <div className={styles.x00Left}></div>
        <div className={styles.x00Right}></div>
        <div className={styles.x01Left}></div>
        <div className={styles.x01Right}></div>
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
        <div className={styles.x21Left}></div>
        <div className={styles.x21Right}></div>
        <div className={styles.x22Left}></div>
        <div className={styles.x22Right}></div> */}
        </div>
    );
};
export default TicTacToeBoard;
