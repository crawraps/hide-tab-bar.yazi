--- @since 25.5.31
--- @sync entry

local function setup(_, opts)
	local max_width = opts.max_width or 20

	Tabs.height = function()
		return 0
	end

	Header:children_add(function(self)
		if #cx.tabs < 2 then
			return ""
		end

		local active = th.tabs.active
		local inactive = th.tabs.inactive

		local active_raw = active:raw()
		local inactive_raw = inactive:raw()
		local active_bg = active_raw and active_raw.bg or "reset"
		local inactive_bg = inactive_raw and inactive_raw.bg or "reset"

		local si = th.tabs.sep_inner
		local so = th.tabs.sep_outer
		local max = math.floor(max_width)

		local spans = {
			ui.Span(so.open):fg(inactive_bg),
		}

		for i = 1, #cx.tabs do
			local name = ui.truncate(string.format(" %d %s ", i, cx.tabs[i].name), { max = max })
			if i == cx.tabs.idx then
				spans[#spans + 1] = ui.Span(si.open):fg(active_bg):bg(inactive_bg)
				spans[#spans + 1] = ui.Span(name):style(active)
				spans[#spans + 1] = ui.Span(si.close):fg(active_bg):bg(inactive_bg)
			else
				spans[#spans + 1] = ui.Span(name):style(inactive)
			end
		end

		spans[#spans + 1] = ui.Span(so.close):fg(inactive_bg)

		return ui.Line(spans)
	end, 500, Header.RIGHT)
end

return { setup = setup }
