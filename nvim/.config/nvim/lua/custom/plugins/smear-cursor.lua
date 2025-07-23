return {
  'sphamba/smear-cursor.nvim',
  event = 'VimEnter',
  opts = {
    -- Fast animation settings
    stiffness = 0.7, -- Higher stiffness for snappier movement
    trailing_stiffness = 0.5, -- Trailing stiffness for smooth trail
    stiffness_insert_mode = 0.7, -- Insert mode stiffness
    trailing_stiffness_insert_mode = 0.7, -- Insert mode trailing stiffness
    damping = 0.7, -- Higher damping to reduce overshoot
    damping_insert_mode = 0.8, -- Insert mode damping
    distance_stop_animating = 0.5, -- Stop animating when close to target
    time_interval = 7, -- Lower time interval for higher framerate (default is 17ms)

    -- Smear cursor when switching buffers or windows
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines
    smear_between_neighbor_lines = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Smear cursor in insert mode
    smear_insert_mode = true,

    -- Set to true if your font supports legacy computing symbols (block unicode symbols)
    -- Smears will blend better on all backgrounds
    legacy_computing_symbols_support = false,
  },
}
