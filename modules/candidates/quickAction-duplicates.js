quickAction.CandidateDuplicateMenu = function(menuDataItemType, menuDataItemId, menuX, menuY, permissions, mergeUrl, removeUrl)
{
    quickAction.DefaultMenu.call(this, menuDataItemType, menuDataItemId, menuX, menuY, permissions);
    this.mergeUrl = mergeUrl;
    this.removeUrl = removeUrl;
};

quickAction.CandidateDuplicateMenu.prototype = Object.create(quickAction.DefaultMenu.prototype);

quickAction.CandidateDuplicateMenu.prototype.getOptions = function()
{
    if(this.getPermissions().candidates_merge)
    {
        return [
            new quickAction.LinkMenuOption("Unir", this.urlDecode(this.mergeUrl), 0),
            new quickAction.LinkMenuOption("Eliminar la advertencia de duplicidad", this.urlDecode(this.removeUrl), 1)
        ];
    }
    return null;
};

quickAction.CandidateDuplicateMenu.prototype.urlDecode = function(url)
{
    return decodeURIComponent(url.replace(/\+/g, " "));
};
