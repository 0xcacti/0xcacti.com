<script>
  export let tabs = [];
  let activeTab = tabs[0]?.id;

  function setActiveTab(tabId) {
    activeTab = tabId;
  }
</script>

<div>
  <div class="bg-white">
    <nav class="flex flex-col sm:flex-row">
      {#each tabs as tab (tab.id)}
        <button
          class="text-gray-600 py-4 px-6 block hover:text-blue-500 bg-blue-100 focus:outline-none {activeTab ===
          tab.id
            ? 'border-b-2 font-medium border-blue-500'
            : ''}"
          on:click={() => setActiveTab(tab.id)}
        >
          {tab.title}
        </button>
      {/each}
    </nav>
  </div>

  {#each tabs as tab (tab.id)}
    {#if activeTab === tab.id}
      <div class="p-5 bg-blue-100">
        <h2 class="text-xl font-bold mb-3 bg-green-200">{tab.title}</h2>
        <p>{tab.content}</p>
      </div>
    {/if}
  {/each}
</div>
