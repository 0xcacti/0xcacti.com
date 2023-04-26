<script>
  import FindGameCard from "./FindGameCard.svelte";
  import NewGameCard from "./NewGameCard.svelte";
  let content;

  const cardFindGame = FindGameCard;
  const cardNewGame = NewGameCard;

  function onClickFindGame() {
    content = cardFindGame;
  }

  function onClickNewGame() {
    content = cardNewGame;
  }
</script>

<div class="gameplay-container border h-full">
  <div class="card flex-col justify-center space-y-2 border">
    <div class="flex border w-full justify-between">
      <button on:click={onClickFindGame}>Find Game</button>
      <button on:click={onClickNewGame}>New Game</button>
    </div>
    <div class="w-full border text-center">
      <p class="py-6">
        Create a new game or look up an existing game using the game ID received
        during creation.
      </p>
    </div>
    <div class="card w-full shadow-2xl bg-base-100 items-center border">
      {#if content === cardFindGame || content === undefined}
        <FindGameCard />
      {:else if content === cardNewGame}
        <NewGameCard />
      {/if}
    </div>
  </div>
</div>
