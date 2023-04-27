<script lang="ts">
  import TicTacToe from "./rendering/TicTacToe.svelte";
  import Controler from "./gameplay/Controler.svelte";
  import ConnectionManager from "./ConnectionManager.svelte";
</script>

<div class="game">
  <ConnectionManager />
  <TicTacToe />
  <Controler />
</div>
