<script setup lang="ts">
import Input from '@/components/ui/input/Input.vue'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
</script>

<template>
  <nav
    class="flex h-16 items-center justify-between gap-2 border-b bg-muted/40 px-6"
  >
    <!-- Search bar with an icon, styled to align well with the rest of the UI -->
    <form class="relative h-fit w-full max-w-96">
      <iconify-icon
        class="absolute left-2.5 top-[50%] translate-y-[-50%] text-muted-foreground"
        icon="lucide:search"
      ></iconify-icon>
      <Input
        class="w-full bg-background pl-8"
        type="text"
        placeholder="Search ..."
      />
    </form>

    <!-- User Account Dropdown -->
    <!-- Uses avatar and dropdown menu for account-specific actions like profile and subscription management. -->
    <DropdownMenu>
      <DropdownMenuTrigger>
        <Avatar>
          <AvatarImage
            src="https://github.com/radix-vue.png"
            alt="@radix-vue"
          />
          <AvatarFallback>CN</AvatarFallback>
        </Avatar>
      </DropdownMenuTrigger>
      <DropdownMenuContent>
        <DropdownMenuLabel>My Account</DropdownMenuLabel>
        <DropdownMenuSeparator />
        <DropdownMenuItem>Profile</DropdownMenuItem>
        <DropdownMenuItem>Billing</DropdownMenuItem>
        <DropdownMenuItem>Team</DropdownMenuItem>
        <DropdownMenuItem>Subscription</DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  </nav>
</template>
