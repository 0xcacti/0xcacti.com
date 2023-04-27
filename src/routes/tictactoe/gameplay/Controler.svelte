<script>
  import { writable } from "svelte/store";
  import BaseCard from "./BaseCard.svelte";

  import "@rainbow-me/rainbowkit/styles.css";

  let cardID = writable(0);
  let activeCardColor = "bg-green-300";
  let inactiveCardColor = "bg-green-100";

  function onClickFindGame() {
    $cardID = 0;
  }

  function onClickNewGame() {
    $cardID = 1;
  }
</script>

<div class="gameplay-container flex flex-col justify-center h-2/3">
  <div class="flex w-full justify-start">
    <button
      class="rounded-b-none bg-blue-100 {$cardID === 0
        ? activeCardColor
        : inactiveCardColor}"
      on:click={onClickFindGame}>Find Game</button
    >

    <button
      class="rounded-b-none {$cardID === 0
        ? inactiveCardColor
        : activeCardColor}"
      on:click={onClickNewGame}>New Game</button
    >
  </div>
  <BaseCard {cardID} />
</div>
