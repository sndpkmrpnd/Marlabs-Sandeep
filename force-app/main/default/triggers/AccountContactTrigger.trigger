trigger AccountContactTrigger on Contact (after insert,after update) {
  AccountContactTagging.tagAccount(trigger.new);
}