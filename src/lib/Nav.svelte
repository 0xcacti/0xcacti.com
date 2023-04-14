<script>
    let showMenu = false;
  
    function toggleNavbar() {
      showMenu = !showMenu;
    }
  </script>
  

    <div class="mb-40">
      <nav
        class="container flex justify-start px-6 py-8 mx-auto md:flex md:justify-start md:items-center"
      >
        <div class="flex-col items-center pr-96">
          <a
            class="text-xl font-bold text-gray-800 md:text-2xl hover:text-blue-400"
            href="/home"
            >0xcacti
          </a>
          <!-- Mobile menu button -->
          <div on:click={toggleNavbar} on:keydown={toggleNavbar} class="flex md:hidden">
            <button
              type="button"
              class="text-gray-800 hover:text-gray-400 focus:outline-none focus:text-gray-400"
            >
            </button>
          </div>
        </div>

        <div
          class="flex-col mt-8 space-y-4 ps-8 pt-2 md:flex md:space-y-0 md:flex-row md:items-center md:space-x-20 md:mt-0 {showMenu
            ? 'flex'
            : 'hidden'}"
        >
          <a class="text-gray-800 hover:text-blue-400" href="/projects">Projects</a>
          <a class="text-gray-800 hover:text-blue-400" href="/blog">Blog</a>
        </div>
      </nav>
    </div>
