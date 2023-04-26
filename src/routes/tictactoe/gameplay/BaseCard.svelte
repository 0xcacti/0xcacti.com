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
  class="card flex flex-col justify-center bg-green-300 rounded-tl-none rounded-bl-lg rounded-br-lg rounded-tr-lg shadow-lg h-full"
>
  <div class="w-full border text-center">
    <p class="py-6">
      Create a new game or look up an existing game using the game ID received
      during creation.
    </p>
  </div>
  <div class="card w-full shadow-2xl bg-base-100 items-center border">
    {#if activeCard === 0}
      <FindGameCard />
    {:else if activeCard === 1}
      <NewGameCard />
    {/if}
  </div>
</div>
