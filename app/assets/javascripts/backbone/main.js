

 String.prototype.stripTags = function() {
    return this.replace(/<\/?[^>]+>/g, '');
 };       


