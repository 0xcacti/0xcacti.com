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

            <div className="gameplay-container flex flex-col justify-center h-2/3">
  <div className="flex w-full justify-start">
    <button
      className="rounded-b-none bg-blue-100 {$cardID === 0
        ? activeCardColor
        : inactiveCardColor}"
      on:click={onClickFindGame}>Find Game</button
    >

    <button
      className="rounded-b-none {$cardID === 0
        ? inactiveCardColor
        : activeCardColor}"
      on:click={onClickNewGame}>New Game</button
    >
  </div>
  <BaseCard {cardID} />
</div>
        </div>


        ### Base card 
        <script lang="ts">
  import { onMount } from "svelte";
  import FindGameCard from "./FindGameCard.svelte";
  import NewGameCard from "./NewGameCard.svelte";

  export let cardID;
  let activeCard = 0;

  onMount(() => {
    const unsubscribe = cardID.subscribe((value) => {
      activeCard = value;
    });
    return unsubscribe;
  });
</script>

<div
  class="card flex z-10 flex-col justify-center bg-green-300 rounded-tl-lg rounded-bl-lg rounded-br-lg rounded-tr-lg shadow-lg h-full -mt-1"
>
  <div class="w-full text-center">
    <p class="py-6">
      Create a new game or look up an existing game using the game ID received
      during creation.
    </p>
  </div>
  <div class="card w-full shadow-2xl bg-green-100 items-center rounded-lg">
    {#if activeCard === 0}
      <FindGameCard />
    {:else if activeCard === 1}
      <NewGameCard />
    {/if}
  </div>
</div>

### Find Game Card 
<div class="card-body">
  <div class="form-control flex justify-between">
    <div class="flex-grow">
      <input
        type="text"
        class="h-full w-full rounded-md border-gray-200 shadow-sm focus:border-purple-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 p-2"
        placeholder="Enter text"
      />
    </div>
    <div>
      <button
        type="submit"
        class="inline-flex flex-none items-center px-4 py-2 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
      >
        Lookup
      </button>
    </div>
  </div>
</div>

### 

### new game card 

<div class="card-body">
  <div class="form-control flex-column justify-between space-y-3 py-4">
    <div class="w-full h-10">
      <input
        type="text"
        class="h-full w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 p-2"
        placeholder="Enter Player Zero Address"
      />
    </div>
    <div class="w-full h-10">
      <input
        type="text"
        class="h-full w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 p-2"
        placeholder="Enter Player One Address"
      />
    </div>

    <div class="flex justify-end">
      <button
        type="submit"
        class="inline-flex flex-none items-center px-4 py-2 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
      >
        New Game
      </button>
    </div>
  </div>
</div>
    );
};

export default Home;
