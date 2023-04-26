<script>
  import { writable } from "svelte/store";
  import BaseCard from "./BaseCard.svelte";

  let cardID = writable(0);

  function onClickFindGame() {
    $cardID = 0;
  }

  function onClickNewGame() {
    $cardID = 1;
  }
</script>

<div class="gameplay-container border flex flex-col justify-center h-2/3">
  <div class="flex w-full justify-start">
    <button class="bg-blue-300 rounded-b-none" on:click={onClickFindGame}
      >Find Game</button
    >
    <button on:click={onClickNewGame}>New Game</button>
  </div>
  <BaseCard {cardID} />
</div>
