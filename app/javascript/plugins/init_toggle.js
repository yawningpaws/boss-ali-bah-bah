const toggleCollapse = () => {
  if (window.location.pathname === "/organisation") {
    if (window.location.hash) {
      const anchorTag = window.location.hash;
      const articleAnchor = document.querySelector(anchorTag);
      const articleCollapse = articleAnchor.querySelector(".collapse");
      if(articleCollapse){
        articleCollapse.classList.add("show");
      }
    }
  }
};
export { toggleCollapse };
