<script lang="ts">
  import { onMount } from "svelte";
  import { defaultEvmStores } from "svelte-ethers-store";

  //   import {
  //     connected,
  //     provider,
  //     signer,
  //     chainId,
  //     chainData,
  //   } from "svelte-ethers-store";

  //   const { name, chainId } = await $provider.getNetwork();

  //   const balance = await $signer.getBalance();

  onMount(() => {
    // add a test to return in SSR context
    defaultEvmStores.setProvider();
  });
</script>
