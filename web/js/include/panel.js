function initPanel() {
    $("div.panel h3.head").each(function() {
            this.click(function(){
                $("div.content a").attr("target", "contentFrame");
            });
    });
}