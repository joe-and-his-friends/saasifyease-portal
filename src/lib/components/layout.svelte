<script lang="js">
	import '$lib/assets/global.css';
	import Navbar from './headernav.svelte';
</script>

<Navbar />
<div class="md:container md:mx-auto">
	<slot />
</div>
