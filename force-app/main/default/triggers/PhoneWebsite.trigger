trigger PhoneWebsite on Account (before insert) {
      //PhoneWebsiteHandeller.phoneUpdate(Trigger.new);
       PhoneWebsiteHandeller.websiteUpdate(Trigger.new);
}