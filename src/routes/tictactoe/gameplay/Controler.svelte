<script>
  import { writable } from "svelte/store";
  import BaseCard from "./BaseCard.svelte";

  let cardID = writable(0);
  let activeCardColor = "bg-green-300";
  let inactiveCardColor = "bg-inherit";

  function onClickFindGame() {
    $cardID = 0;
  }

  function onClickNewGame() {
    $cardID = 1;
  }
</script>

<div class="gameplay-container border flex flex-col justify-center h-2/3">
  <div class="flex w-full justify-start">
    <button
      class="bg-blue-300 rounded-b-none {$cardID === 0
        ? activeCardColor
        : inactiveCardColor}"
      on:click={onClickFindGame}>Find Game</button
    >
    <button
      class="bg-blue-300 rounded-b-none {$cardID === 0
        ? inactiveCardColor
        : activeCardColor}"
      on:click={onClickNewGame}>New Game</button
    >
  </div>
  <BaseCard {cardID} />
</div>
