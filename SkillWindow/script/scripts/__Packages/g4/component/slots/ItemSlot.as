class g4.component.slots.ItemSlot extends g4.component.slots.BasicSlot
{
   function ItemSlot()
   {
      super();
   }
   function __get__itemSlotP()
   {
      return this._itemSloP;
   }
   function configUI()
   {
      super.configUI();
      this._tf_amount = this.tf_amount;
      this._tf_amount.textAutoSize = "shrink";
      this._tf_enchant = this.tf_enchant;
      this._iconContainer = this.iconContainer;
      this._bitmapContainer = this.bitmapContainer;
      this._visible = false;
      if(this._itemSloP != null)
      {
         this.setData(this._itemSloP);
         this.updateSlot();
      }
   }
   function setData(data)
   {
      this._itemSloP = (g4.gameInterface.dataP.ItemSlotP)data;
      if(this._isConfigUIComplete == false)
      {
         return undefined;
      }
      super.setData(data);
   }
   function updateSlot()
   {
      if(this._isConfigUIComplete == false)
      {
         return undefined;
      }
      this._tf_amount._visible = false;
      if(this._data == null)
      {
         this._visible = false;
         return undefined;
      }
      this._visible = true;
      if(this._iconContainer.iconPath != this._itemSloP.IconPath)
      {
         this._iconContainer.clear();
         lib.display.DrawBitmapData.draw(this._iconContainer,this._itemSloP.IconPath,2,2,0,0,50,50,0.78125);
         this._iconContainer.iconPath = this._itemSloP.IconPath;
      }
      this._bitmapContainer.clear();
      var _loc2_ = this._itemSloP.Impossible == true || this._itemSloP.Disabled == true;
      if(this._itemSloP.Amount > 0)
      {
         this._tf_amount._visible = true;
         this._tf_amount.text = String(this._itemSloP.Amount);
         this._tf_amount.textColor = _loc2_ != true?16777215:7368816;
      }
      if(this._itemSloP.Enchant > 0)
      {
         var _loc3_ = _loc2_ != false?21433:3615811;
         if(11 < this._itemSloP.Enchant && this._itemSloP.Enchant < 15)
         {
            _loc3_ = _loc2_ != false?8915599:2299429;
         }
         else if(14 < this._itemSloP.Enchant)
         {
            _loc3_ = _loc2_ != false?10624002:4074792;
         }
         this._tf_enchant.text = "+" + this._itemSloP.Enchant;
         this._tf_enchant.shadowColor = _loc3_;
         this._tf_enchant._visible = true;
      }
      else
      {
         this._tf_enchant._visible = false;
      }
      if(this._itemSloP.Impossible == true)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("SlotComponent_Impossible"),0,0,0,0,54,54,1);
      }
      if(this._itemSloP.Disabled == true)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("SlotComponent_Disabled"),0,0,0,0,54,54,1);
      }
      if(this._itemSloP.Grade > 0)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("SlotComponent_IconGrade" + this._itemSloP.Grade),2,2,0,0,11,11,1);
      }
      if(this._itemSloP.Master > 0)
      {
         switch(this._itemSloP.Master)
         {
            case 1:
               lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("SlotComponent_Master" + this._itemSloP.Master),37,34,0,0,15,19,0.69);
               break;
            case 2:
               lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("SlotComponent_Master" + this._itemSloP.Master),32,37,0,0,19,14,1);
         }
      }
      if(this._itemSloP.SealType > 0)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("SlotComponent_IconSeal" + this._itemSloP.SealType),17,12,0,0,20,28,1);
      }
      if(this._itemSloP.New)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("SlotComponent_New"),0,0,0,0,54,54,1.4210526315789473);
      }
      if(this._itemSloP.Durability > 0)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("SlotComponent_Durability" + this._itemSloP.Durability),0,0,0,0,54,54,1.4210526315789473);
      }
   }
}
